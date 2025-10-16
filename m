Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F1ACCD194
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 05:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h43Lpj0QWKhbWHWyTH/CRqgeEv5tT9Y15JOhJ6HkdJ0=; b=gR0SiddZtbe528cwZj+pRJZPSH
	GVP04ilDt+uHM9oh56gGdV8If7kI6kNEP2UylnXPzfT/iXTVNQXlOQFIEmT5aVfuWAloPmqIUFyJQ
	F+Rky94UFApdXeygHIL5StmBFYGP+PfNZJsBkg0w9gE5TNAXyeD0BlvQj2RDh41MNssBsgD8Vm6Bv
	4YPCP+q9jn9nD0LpJEqwoDLg2v8Xq42QnsS+FNVV/s3Sd3P4gZ0IzWjbbfrS7qh6d+M0QHSGtOGfz
	AXWUAqgpPmO1cEWwPZJYBV6ITgG1gf5U5IT7a64gKPRHL8WZGXnqIxzbSFE+qxLcRuUcRphdXt41K
	zpLZ+blg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Gvj-00000003Xk6-1LjX;
	Thu, 16 Oct 2025 05:53:39 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Gvh-00000003Xjd-0diR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 05:53:38 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b4f323cf89bso59662266b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 22:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760594015; x=1761198815; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h43Lpj0QWKhbWHWyTH/CRqgeEv5tT9Y15JOhJ6HkdJ0=;
        b=KgWtnLSe7PXl0/K/lxLh7xiwBhENDSJcymO+rLPG1zcxFXOtTIzbMZGOa1CkvsFsV9
         IE3Efa0u6/3TG8dYX6Q8btSniQZLumuVTwJqYYUAUyLjVUhb8clLLJ95inSjOQ9S1RSg
         tY8ugRUyALorrhSxiWcA5j90FPq267Gi9J+9/LY8LyNuSRMAcNJZgg10q2OJPwabJamt
         aRKOYz244u447w811thomMw4GobtnTFgRYkXyBDGaVb6qcpXX+Gf5EFHodKyWod7zUxY
         2QNs0FONs7fvMpfag16MZZxj97+N500lK3p+SUUFpgnuIIe44cYcJlfc9+nM5fH6F+uP
         s4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760594015; x=1761198815;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h43Lpj0QWKhbWHWyTH/CRqgeEv5tT9Y15JOhJ6HkdJ0=;
        b=grpaE1SOJX9HWEAy8QBs9E09svQoaOgdLq7p5sfX7K2me40Dk/f5iZ7nv5xuWn941M
         5v350aASiscbz4AWUHQYZh+Q/ThaU0krt5l2aNoQlX4QEn3L02Tqvf2fi17q5fEu+uih
         nXh75SBAH/uurw2mEB+KfegmvdfaT73jyyrd6FzWPulaA48yuiGxiw+hf/Ct+4z5yCg+
         0wNjOhJKhhvBHFiqwa/9YzpSrxH4052kRpv5EPdF19juMZuc+YCZIcqkd9wir6/X1/X9
         p+fb3Pt0mb3U9pJs7iKiYUtdav3Qq7/XZf6TS6bc+O+13ZMSYTjuKjit0apOkw9aOMYb
         bIdA==
X-Forwarded-Encrypted: i=1; AJvYcCUns5hQpXR7QHkk6d9ohQl49Hre6WoMgHATlrATJV3Ef9OPZAz4xKpCWvuWfHKTkH+ig4Y8vKuOFlhoLA1E3mbV@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5Udavt9fxQBCYknL4KeMguqv5hkejXDIpxZomySJGTaiQhcPO
	x/dBnZxTOzZBrgnuv1EPqI3KEmUM7QgBGq1oqQXdxbrlN/fhOe7oUO3nWyorn6velJg=
X-Gm-Gg: ASbGncv0qdr/FKkg6lQU+/eyYmmhoN04cdYh8daLasvkVWayxB3YHMlHzNRwFB0LfYK
	5GebbHUnE5VUZ8+xS4arSvgf/bE5CUS2hwXer4/Mu5yK/p3HUWtaAic24+GkOgLJXihsYO0qsuU
	xFVdGALghfMjWX+LPTksq8rJpV3+E04R7fAYcp5Lj7U0w+NeXdkWH4K+cj3q6tKMep1qDgmM3NF
	cuuTkR6exQHE5LXsS5XcYIhjHFThkllLJwHlBR1LMKxDrtgGyPglv3wIVGcJtMl3eQ4nqstZTJH
	k18ZRQtbEMr5jl/4EUZmcsHVfay7oL6SDz4OQflsUGu/IAuqq/1co00Q7ZBt6ERsyJRMw1UcFJu
	DP6xjk0mWh7N8uCuGqO8/9SlVsTKGT8SFjfIzAJ8haE8Wd7u0nMDIaPO+5wdk9AbGsezf/U90Nt
	8YxOD/+yzGvw/jIceD4NC+OnOWMBSS
X-Google-Smtp-Source: AGHT+IG6k82old8Ss2xXFGeUWZ0Z24OHhJFIC1WYkbpaOPTTbKORZrmrrZeZpS+oP1oVNSzs9LZc9A==
X-Received: by 2002:a17:906:cb85:b0:b54:8670:7c2d with SMTP id a640c23a62f3a-b5486707c37mr2358791766b.55.1760594015284;
        Wed, 15 Oct 2025 22:53:35 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cccdaa0f9sm427529166b.45.2025.10.15.22.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 22:53:34 -0700 (PDT)
Message-ID: <5fa16d95c5b421253135c5ec7974e99b8724f395.camel@linaro.org>
Subject: Re: [PATCH 2/9] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar	 <alim.akhtar@samsung.com>, Tudor
 Ambarus <tudor.ambarus@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Sam Protsenko	
 <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Krzysztof
 Kozlowski	 <krzysztof.kozlowski@linaro.org>, kernel-team@android.com
Date: Thu, 16 Oct 2025 06:53:33 +0100
In-Reply-To: <20251013-automatic-clocks-v1-2-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
	 <20251013-automatic-clocks-v1-2-72851ee00300@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-2+build3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_225337_240166_B74ECAFC 
X-CRM114-Status: GOOD (  16.53  )
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

T24gTW9uLCAyMDI1LTEwLTEzIGF0IDIxOjUxICswMTAwLCBQZXRlciBHcmlmZmluIHdyb3RlOgo+
IFVwZGF0ZSB0aGUgYmluZGluZ3MgZG9jdW1lbnRhdGlvbiBzbyB0aGF0IGFsbCBDTVVzICh3aXRo
IHRoZSBleGNlcHRpb24gb2YKPiBnczEwMS1jbXUtdG9wKSBoYXZlIHNhbXN1bmcsc3lzcmVnIGFz
IGEgcmVxdWlyZWQgcHJvcGVydHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgR3JpZmZpbiA8
cGV0ZXIuZ3JpZmZpbkBsaW5hcm8ub3JnPgo+IC0tLQo+IMKgLi4uL2JpbmRpbmdzL2Nsb2NrL2dv
b2dsZSxnczEwMS1jbG9jay55YW1swqDCoMKgwqDCoMKgwqDCoCB8IDIzICsrKysrKysrKysrKysr
KysrKysrKy0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9j
bG9jay9nb29nbGUsZ3MxMDEtY2xvY2sueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9jbG9jay9nb29nbGUsZ3MxMDEtCj4gY2xvY2sueWFtbAo+IGluZGV4IGNhZjQ0MmVh
ZDI0YmRhNTdlNTMxNDIwZDhhN2Q4ZGU4NzEzMDMyYWUuLjVjZmU5OGQ5YmE4OTVkNTIwN2ZmZmM4
MmYzZmQ1NWI2MDJiNGEyYmIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS1jbG9jay55YW1sCj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2NrL2dvb2dsZSxnczEwMS1jbG9jay55YW1sCj4g
QEAgLTQ5LDYgKzQ5LDExIEBAIHByb3BlcnRpZXM6Cj4gwqDCoCByZWc6Cj4gwqDCoMKgwqAgbWF4
SXRlbXM6IDEKPiDCoAo+ICvCoCBzYW1zdW5nLHN5c3JlZzoKPiArwqDCoMKgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUKPiArwqDCoMKgIGRlc2NyaXB0aW9u
Ogo+ICvCoMKgwqDCoMKgIFBoYW5kbGUgdG8gc3lzdGVtIHJlZ2lzdGVycyBpbnRlcmZhY2UuCj4g
Kwo+IMKgcmVxdWlyZWQ6Cj4gwqDCoCAtIGNvbXBhdGlibGUKPiDCoMKgIC0gIiNjbG9jay1jZWxs
cyIKPiBAQCAtMTYzLDYgKzE2OCwyMiBAQCBhbGxPZjoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLSBjb25zdDogYnVzCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IGlwCj4g
wqAKPiArwqAgLSBpZjoKPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOgo+ICvCoMKgwqDCoMKgwqDC
oCBjb21wYXRpYmxlOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqAgY29udGFpbnM6Cj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZW51bToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBnb29n
bGUsZ3MxMDEtY211LWFwbQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGdvb2dsZSxn
czEwMS1jbXUtbWlzYwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGdvb2dsZSxnczEw
MS1oc2kwCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1o
c2kyCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZ29vZ2xlLGdzMTAxLWNtdS1wZXJp
YzAKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBnb29nbGUsZ3MxMDEtY211LXBlcmlj
MQo+ICsKPiArwqDCoMKgIHRoZW46Cj4gK8KgwqDCoMKgwqAgcmVxdWlyZWQ6Cj4gK8KgwqDCoMKg
wqDCoMKgIC0gc2Ftc3VuZyxzeXNyZWcKPiArCj4gwqBhZGRpdGlvbmFsUHJvcGVydGllczogZmFs
c2UKPiDCoAo+IMKgZXhhbXBsZXM6Cj4gQEAgLTE3Miw3ICsxOTMsNyBAQCBleGFtcGxlczoKPiDC
oAo+IMKgwqDCoMKgIGNtdV90b3A6IGNsb2NrLWNvbnRyb2xsZXJAMWUwODAwMDAgewo+IMKgwqDC
oMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJnb29nbGUsZ3MxMDEtY211LXRvcCI7Cj4gLcKgwqDC
oMKgwqDCoMKgIHJlZyA9IDwweDFlMDgwMDAwIDB4ODAwMD47Cj4gK8KgwqDCoMKgwqDCoMKgIHJl
ZyA9IDwweDFlMDgwMDAwIDB4MTAwMDA+OwoKVGhpcyBzZWVtcyB1bnJlbGF0ZWQsIG9yIGF0IGxl
YXN0IG5vdCBtZW50aW9uZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKQ2hlZXJzLApBbmRyZScK
Cj4gwqDCoMKgwqDCoMKgwqDCoCAjY2xvY2stY2VsbHMgPSA8MT47Cj4gwqDCoMKgwqDCoMKgwqDC
oCBjbG9ja3MgPSA8JmV4dF8yNF81bT47Cj4gwqDCoMKgwqDCoMKgwqDCoCBjbG9jay1uYW1lcyA9
ICJvc2NjbGsiOwo=


