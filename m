Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58439C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 23:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0M6BIbKkCL4BuQHLkwNfOtXVF4FD4eT1saE9fb6Qwh8=; b=3SGSWumo08oTkxnSsSRvbavVlL
	add3aBCjZQgXdwpOAydpePqnaZ5iY1qHZYnAMpL/1FNh3PhjESJSMcZmabmx2IeUUSoQrEsbRUvde
	nnVNxA9tlfpcDuGqxs2sGkgB1SeWzzafCNgHhNdaKxh1aZH1V0kcQjHYgHLkNjmNq+PY0xtYLN1GB
	2s0ubDg5jYjBjnn8IIfMd8F8/cLF7K+vPkB6NqyO2KtrTdTg9yhrRAjqy0sWO0ztb/+dTc3qfuK53
	8TmVa73zn5vYeyT9wF1NedFtpcrE/6odHiPX9g2R9iaGWDfk3/5MJ4gjrElfwUZkFE6QGZB4iOFLm
	j0Ygsq3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIbkN-000000053zC-2TPr;
	Fri, 23 May 2025 23:24:15 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIbiJ-000000053oS-1J0l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 23:22:08 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7c5e39d1e0eso32767685a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 16:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748042526; x=1748647326; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0M6BIbKkCL4BuQHLkwNfOtXVF4FD4eT1saE9fb6Qwh8=;
        b=Jw1/wKdfsczKlm77M6vm0p85pabHkESN5w20k5fj4ArfjeWXIRZKpnwOL1a6oipspG
         YaWpVVrLxN3gYCQunxrJgDAIU0sHHmb43ogU9U++2rlbbfK8Wq6WehhB0NqYfqOs+xiE
         kuzj4tEVSz0ynDxkQXCutGyjSAnCqbTBzv2yFLRy6mtT4S4IdWgOn+XB1lm1RH5SQy4/
         uT09ARP2RtJlIdYdDqPegQS5iUfjpRjjymGQSczgeIVY+XJvIf8kYd0T+qxcL/OaPMNs
         4E8zxLR5BlbQQlKYTTKmCNYXUjgZFwNF+QhalgiGbN3dde1pbXrT0xMgvHiSZG/w4xhD
         DvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748042526; x=1748647326;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0M6BIbKkCL4BuQHLkwNfOtXVF4FD4eT1saE9fb6Qwh8=;
        b=Ekf9PcU7FjAKAGF08zcxdkJGu3s2GI/ZtVYZNLTHTCsoBKS4xdRsBaRvV5BEZx34is
         srgsk3QrVgCoxQxYMv8LvZY2D6wY5DlAeZUXC8Qkfv6xtbH4/O6WBDu/h3p98k/EDmCk
         vapx2LDTTKJO+AdEvVzEvoCeDAQdZxvbSRNKa5PL4S50kxknVbRfr1qBOfKLuWA/16nA
         ywEixNz2LHV72RPtJUKTMmytaQfqUI6n3LlIbotMnMZYnCIXKqvrzbGEFKp5uqlTmlYq
         545t99RHnO9dvitu9UtPnXjdeLM6tsNXCBJCTORD6HR0Ny09WcUO4ItP6OuKBjXfQIgF
         F6qA==
X-Forwarded-Encrypted: i=1; AJvYcCUZUZDYOmx4t4ofTob4Mkqtbsep4Af1ITVOBvc0hTEupmxE22eFBMvD5SzUG9K7TDAivk4h8nYxUYKcfKdQVKD6@lists.infradead.org
X-Gm-Message-State: AOJu0YwY1sgf1ukb5Fkk32HwejbSSO8aCN460l8d7peeQY7QiA6wvJ+H
	82AZZ9Zc/p35wTZEc+VAzRpGfixKuhgtQF0NwbPS+4t6WZqzCugUhXt+dXxln42hpJY=
X-Gm-Gg: ASbGnctvbGG+LTnnsvMUv6IRXXntz5XhmKc0YNjE/KK0gKPnQavtnclVkdH4/MXkkzg
	RWUQW8PcDOE/7SxtrB4r4GJVPvyC4HbxGWJp++gq2JZ315UF6Hi3kwr6OACEGf6q6VVNRweLI7p
	QRTq1m+PjRq4bQmvLvp/z6OMfxPp5DLiMGj/YSQ3Hk4ps6hbNKk42fMcJmrNyog8SI0OVNt0Nix
	CXfsAi4GB3hNjRYXlZobEDLRVeYG5PjBGKVjOOPiej3CvIwtC5ZCmh0iqB2NkRXEjgrPskOmkNJ
	8vNH1WcaoP8AxWCIi4Z/qdMpR6ZzSeKAfQsLzwOjML+S0ODRcScEZEy4
X-Google-Smtp-Source: AGHT+IEIMXrXdUEGP0sasHkicBsBeTsvbtxxsfrCzTtv247fRI8qwLbIJGGL+3bJAWxBYrqeC4TcKQ==
X-Received: by 2002:a05:620a:319c:b0:7ca:dac1:a2d9 with SMTP id af79cd13be357-7ceecbe014fmr161204785a.28.1748042525994;
        Fri, 23 May 2025 16:22:05 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::c41? ([2606:6d00:17:b2fc::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467ef2fbsm1249034185a.59.2025.05.23.16.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 16:22:05 -0700 (PDT)
Message-ID: <eef5ccd99d82dd33e3a4ecdb5d4a5b75ccb0b972.camel@ndufresne.ca>
Subject: Re: [PATCH RESEND 1/2] media: dt-bindings: nxp,imx8-jpeg: Add
 compatible strings for IMX95 JPEG
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Frank Li <Frank.Li@nxp.com>, mirela.rabulea@nxp.com, mchehab@kernel.org,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, 	s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, 	krzysztof.kozlowski@linaro.org
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, ming.qian@nxp.com
Date: Fri, 23 May 2025 19:22:04 -0400
In-Reply-To: <20250521173444.310641-1-Frank.Li@nxp.com>
References: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
	 <20250521173444.310641-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_162207_614901_051DE583 
X-CRM114-Status: GOOD (  15.07  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

SGksCgpMZSBtZXJjcmVkaSAyMSBtYWkgMjAyNSDDoCAxMzozNCAtMDQwMCwgRnJhbmsgTGkgYSDD
qWNyaXTCoDoKPiBBZGQgY29tcGF0aWJsZSBzdHJpbmdzICJueHAsaW14OTUtanBnZGVjIiBhbmQg
Im54cCxpbXg5NS1qcGdlbmMiLCB3aGljaAo+IGFyZSBiYWNrd2FyZCBjb21wYXRpYmxlIHdpdGgg
Im54cCxpbXg4cXhwLWpwZ2RlYyIgYW5kCj4gIm54cCxpbXg4cXhwLWpwZWdlbmMiLiBpLk1YOTUg
anVzdCBuZWVkIG9uZSBwb3dlciBkb21haW4gd2hpY2ggY29tYmluZQo+IHdyYXAgYW5kIGFsbCBz
bG90cyB0b2dldGhlci4gUmVkdWNlIG1pbkl0ZW1zIG9mIHBvd2VyLWRvbWFpbnMgdG8gMSBmb3IK
PiBpLk1YOTUgYW5kIGtlZXAgdGhlIHNhbWUgcmVzdHJpY3Rpb24gZm9yIG90aGVycy4KPiAKPiBS
ZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5h
cm8ub3JnPgo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgoKQWNr
ZWQtYnk6IE5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4K
CktyenlzenRvZiwgd2lsbCB5b3UgdGFrZSB0aGlzIG9uZSBvbmNlIHRoZSBEVFMgcGFydCBpcyBy
ZWFkeSA/CgpyZWdhcmRzLApOaWNvbGFzCgo+IC0tLQo+IMKgLi4uL2JpbmRpbmdzL21lZGlhL254
cCxpbXg4LWpwZWcueWFtbMKgwqDCoMKgwqDCoMKgwqAgfCAyOCArKysrKysrKysrKysrKysrKy0t
Cj4gwqAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL254
cCxpbXg4LWpwZWcueWFtbAo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL254cCxpbXg4LWpwZWcueWFtbAo+IGluZGV4IDJiZTMwYzVmZGM4MzkuLjRjYmE0MmJhN2Nm
NzIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L254cCxpbXg4LWpwZWcueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9ueHAsaW14OC1qcGVnLnlhbWwKPiBAQCAtMjIsMTAgKzIyLDE0IEBAIHByb3Bl
cnRpZXM6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbnhwLGlteDhxeHAtanBnZGVjCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbnhwLGlteDhxeHAtanBnZW5jCj4gwqDCoMKgwqDC
oMKgIC0gaXRlbXM6Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBueHAsaW14OHFtLWpw
Z2RlYwo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBlbnVtOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtIG54cCxpbXg4cW0tanBnZGVjCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC0gbnhwLGlteDk1LWpwZ2RlYwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IG54cCxp
bXg4cXhwLWpwZ2RlYwo+IMKgwqDCoMKgwqDCoCAtIGl0ZW1zOgo+IC3CoMKgwqDCoMKgwqDCoMKg
wqAgLSBjb25zdDogbnhwLGlteDhxbS1qcGdlbmMKPiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51
bToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBueHAsaW14OHFtLWpwZ2VuYwo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG54cCxpbXg5NS1qcGdlbmMKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGNvbnN0OiBueHAsaW14OHF4cC1qcGdlbmMKPiDCoAo+IMKgwqAgcmVnOgo+
IEBAIC00OCw3ICs1Miw3IEBAIHByb3BlcnRpZXM6Cj4gwqDCoMKgwqAgZGVzY3JpcHRpb246Cj4g
wqDCoMKgwqDCoMKgIExpc3Qgb2YgcGhhbmRsZSBhbmQgUE0gZG9tYWluIHNwZWNpZmllciBhcyBk
b2N1bWVudGVkIGluCj4gwqDCoMKgwqDCoMKgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9wb3dlci9wb3dlcl9kb21haW4udHh0Cj4gLcKgwqDCoCBtaW5JdGVtczogMsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgIyBXcmFwcGVyIGFuZCAxIHNsb3QKPiArwqDCoMKgIG1pbkl0
ZW1zOiAxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjIFdyYXBwZXIgYW5kIGFsbCBzbG90
cwo+IMKgwqDCoMKgIG1heEl0ZW1zOiA1wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAjIFdy
YXBwZXIgYW5kIDQgc2xvdHMKPiDCoAo+IMKgcmVxdWlyZWQ6Cj4gQEAgLTU4LDYgKzYyLDI0IEBA
IHJlcXVpcmVkOgo+IMKgwqAgLSBpbnRlcnJ1cHRzCj4gwqDCoCAtIHBvd2VyLWRvbWFpbnMKPiDC
oAo+ICthbGxPZjoKPiArwqAgLSBpZjoKPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+ICvCoMKg
wqDCoMKgwqDCoCBjb21wYXRpYmxlOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFpbnM6Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLSBueHAsaW14OTUtanBnZW5jCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbnhw
LGlteDk1LWpwZ2RlYwo+ICvCoMKgwqAgdGhlbjoKPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+
ICvCoMKgwqDCoMKgwqDCoCBwb3dlci1kb21haW5zOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgbWF4
SXRlbXM6IDEKPiArwqDCoMKgIGVsc2U6Cj4gK8KgwqDCoMKgwqAgcHJvcGVydGllczoKPiArwqDC
oMKgwqDCoMKgwqAgcG93ZXItZG9tYWluczoKPiArwqDCoMKgwqDCoMKgwqDCoMKgIG1pbkl0ZW1z
OiAywqDCoMKgwqDCoMKgwqAgIyBXcmFwcGVyIGFuZCAxIHNsb3QKPiArCj4gKwo+IMKgYWRkaXRp
b25hbFByb3BlcnRpZXM6IGZhbHNlCj4gwqAKPiDCoGV4YW1wbGVzOgo=


