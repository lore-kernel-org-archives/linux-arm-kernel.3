Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA470C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 19:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EXZROqLJHNx8vqsyDj41zSg6OwYEat4w/wJCCIKwrog=; b=srtO0GWq2AMj5HIRdJXEUn13a2
	5MWRedNFDIsczQwfj2XhqgCXFass38Pj/MNMJf6sqPiuEDnqbybT7UkdTJsZvjfTvj3/32kTMztcg
	EeuuSdy+yQ71vv9+xi6wfaPCLvXaj/Borw4AbmN7HbDHebWhaMukqHy2H1k1ImlDU3dmP3msOgmCI
	CjRy3umGjKp6k9TclYmWHySOKu+RzKj7evyV5IA59tdt84lkIii6L2ozE5wB4/N2ifGz/Z4jXSBsE
	5dxqmVCBb9FLnNxjkbHFlDlk9/ldnq5ye4a027TYQE2UM6A1yv/kQ++agALY93rK09ulGAhHbQV8y
	+taGPWKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMn4-00000005KXU-1jhi;
	Thu, 02 Jul 2026 19:09:38 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfMn2-00000005KWc-06og
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 19:09:37 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-39b293079d1so21355541fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 12:09:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783019373; cv=none;
        d=google.com; s=arc-20260327;
        b=YnCXH2GltFLlqWxGjzGGD2NORFtTWi6N1p0TzF6FcD1jMlx43Sz//z2pQ3R2H/AYQp
         gtqFhz0bn7QsAJkVBwo+czzNrKASQMNfVOaYhA0KA4a2drXenLtWIgi1XB/IsnnxTYoL
         4z1kJNHgul+J4s0Mv6vu8z0zK8ItHOCS0gaehpI0maVZ5DeBTM1RS4mH9q+HHNqqbaVx
         iNlHIJ9IuToi3hErYPLCvRU1pcDWzzR0LcnhqfZ3I8r6XnMcnVfa55lrFhEjO7D/ZqBv
         mv37UMQ0lUSKQkuo2Be1wU+r/dmWbEPSro3mg7do9aQ9hjJs+PN5MEVzM/XcJXc7krvN
         6UcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=EXZROqLJHNx8vqsyDj41zSg6OwYEat4w/wJCCIKwrog=;
        fh=ZwUMqXJv8PNoQ4QiKTIbKZz+gVWfooouDgoNq1v2dJM=;
        b=scskjcs2ikWJUoRgOjh09X2sfnMr+9xExHJr8sLXDW+fKT2VAi8SY8Wr2yxy5M3B0b
         l+J/IYTCOY02EJSBfhIQLGnVHkmrDfLhgHZzWjUa3+S5S6j9MKeByPoI1vLn6RA8ZPZX
         tkx/9dowAssBczGV7ZXycSDua+iOpwBzZLs6OOkJUOTfPEMgGW3Z3uFul6kuR/o5nbYK
         OKcYr3BF6lmdrOku4ExHONqQBWEDb4RUXIJnM0t2691somzw4PYLxC+IJig8J39XIqQ+
         6biIcuWWaySfG80yzVSNjxG6Vu+H1PjFW8FyfT1abXE34PZQVmt4J7XnVpFmkui6yyXF
         VngQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783019373; x=1783624173; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EXZROqLJHNx8vqsyDj41zSg6OwYEat4w/wJCCIKwrog=;
        b=j/GV5dyqyx0w/GWf+KQJYYBfHvG4ur8c4/aFWB5X5DAknQHix8B2ppkoE8GEYto8OE
         ForNaKsGgGEFKH9maDUu+v4/5j8qa6CAFBH9Kvq2D1R3Yu97aezjHGBjrf9amm6Jjrgn
         Qmz6YtBbflEHuA0vjFHS7dvJoYhOanLRtpMj0+lcBYA6Po7uqYDOO1x9bKwg7+GgYJtT
         L5Ex3KKCWM3DGtQ8HIF5pqC++GaYtoVXlkqyuxCb20DuyBzWBtqQO5rJOVEkNMKbWks9
         Pd4IYoSHGYAXfQXNV/cMRAi7GWQ5QLjBCHLPAI/lJyzCJKseVidThh+sPV/mul0wAcks
         tZPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783019373; x=1783624173;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EXZROqLJHNx8vqsyDj41zSg6OwYEat4w/wJCCIKwrog=;
        b=iWTXjo8NiuKJvKnkLXgPLUw9eUZWRBDbI1cyBoxLGLXsozNUi7VHNtbVcqmhLCFww3
         y7AbYmPj9wiiTyGdWpZ7VrlBViUwL5+eABP1EWzQkw+AqcTt6pH6MwCqOlrW5PvVWIfd
         2ahpW3T1+2E8EDotkQK60q3A9DNkSTcyy+pZlIB3kBLVfkiQT4vyhBhZ/sMogjddc4Ue
         Vnh4daSWKIbOGLuVmdXeEHGk9XTKJ6kykkmGQ0mSHVn1Hj3BcZl40Lnbxdok7hwO82P+
         coCM+VD7eRENdCWFsodXwSVcijruNpOBFSEtPoUB4p/ypVXFmo3SoCvxdoO5DcL3BXpw
         JbPg==
X-Forwarded-Encrypted: i=1; AHgh+RrriKerqyE2FBp0Bw1hNnBwyZGWkZR1Uwg4kFGbuGlWSjtG5Hchqu28PPmOYyVSZyhXsVtvsfJttpFFuvC6UEYm@lists.infradead.org
X-Gm-Message-State: AOJu0YxPa4YqnTJrY7kilzqW4NqwD44Mv119PpQtIX+G32M6iNqbu/zQ
	9+9zpQzEDfrl9HTilslI6O4yzhAlvO1SUIKk5Gdfqkhui+ZLYEJZFtE8wxc45/foREW1UYqOlG5
	xkmQ2XN1z0seuOmSwKEX4n4rYfDBaxMQ=
X-Gm-Gg: AfdE7ck7R8FbTPY6I2Xr322t8Qfhb8rDDt8vrsrs3/wnBN7uMHb4YyZdwF7wz25T72a
	If4PKpCIUDRpUgU+rkPKhnHBeKgusSk0t20c9Nv6M63KdF5GRcoQqPpVnMhhYBdiQawIJrqUF/1
	2Xgl8XqgQKT7VNUUqqp9dU6MohBkF8rICBnPgVyjw4RVaiCvJagMCNr7zXX4h7dnwNg5VY4eOI2
	/T05cfyGNOld+XWO0ynKdagXLJZLZ5CT3rPSBTVN9Ob+UGiyhp1QXB6PMA0fImqqs85c1KClU6F
	zhh+c3pzxsJNMzxYpb3AWlO6wDPVATA9oW/FFW7O3pGDKV86K1RNVbtVuiz9
X-Received: by 2002:a2e:be88:0:b0:399:9436:15c8 with SMTP id
 38308e7fff4ca-39b36e37e85mr16121011fa.2.1783019372768; Thu, 02 Jul 2026
 12:09:32 -0700 (PDT)
MIME-Version: 1.0
From: Brian Mayer <bleemayer@gmail.com>
Date: Thu, 2 Jul 2026 16:09:20 -0300
X-Gm-Features: AVVi8CdEvAr9zBugTIhbInCo1kaOhwZoytfXTRqItuxxgCr33NwvWgbLZiYlGvc
Message-ID: <CAB3eKoDcp=rVGDpvAHEeVLG3rHFw2E1XXxCe2QaApX0aLkyXyA@mail.gmail.com>
Subject: [PATCH] arm64: dts: rockchip: add HYM8563 RTC to Radxa CM5 IO board
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000057899e0655a58c94"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_120936_100921_6CAFEE38 
X-CRM114-Status: GOOD (  16.11  )
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

--00000000000057899e0655a58c94
Content-Type: text/plain; charset="UTF-8"

Hi kernel team.

I was testing building the kernel for my radxa cm5+io shield, and it turns
out there is no rtc in the DTS, so I got it from the radxa files.
This is my first email to you, please help me correct it if something is
off the standards.

The commit attached does the trick. I used AI to assist me in this in
case you're
wondering.

Best, Brian

--00000000000057899e0655a58c94
Content-Type: application/octet-stream; 
	name="0001-arm64-dts-rockchip-add-HYM8563-RTC-to-Radxa-CM5-IO-b.patch"
Content-Disposition: attachment; 
	filename="0001-arm64-dts-rockchip-add-HYM8563-RTC-to-Radxa-CM5-IO-b.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mr3voroy0>
X-Attachment-Id: f_mr3voroy0

RnJvbSA4ODQxOTgxMDIxYjVmOTg1MjJhZDQ0ZmU0MGUxMWQwYzBlNzU2NTM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcmlhbiBNYXllciA8YmxlZW1heWVyQGdtYWlsLmNvbT4KRGF0
ZTogVGh1LCAyIEp1bCAyMDI2IDE0OjUxOjUxIC0wMzAwClN1YmplY3Q6IFtQQVRDSF0gYXJtNjQ6
IGR0czogcm9ja2NoaXA6IGFkZCBIWU04NTYzIFJUQyB0byBSYWR4YSBDTTUgSU8gYm9hcmQKClRo
ZSBSYWR4YSBDTTUgSU8gY2FycmllciBoYXMgYSBIYW95dSBIWU04NTYzIHJlYWwtdGltZSBjbG9j
ayBvbiBJMkM2IGF0CmFkZHJlc3MgMHg1MSwgd2l0aCBpdHMgaW50ZXJydXB0IGxpbmUgb24gR1BJ
TzBfQjAgYW5kIGEgQ1IxMjIwIGJhY2t1cApiYXR0ZXJ5IGhvbGRlci4gV2l0aG91dCBhIGRldmlj
ZSB0cmVlIG5vZGUsIG5vIC9kZXYvcnRjKiBhcHBlYXJzIGV2ZW4Kd2hlbiBDT05GSUdfUlRDX0RS
Vl9IWU04NTYzIGlzIGVuYWJsZWQuCgpEZXNjcmliZSB0aGUgUlRDLCB3aXJlIHRoZSBpbnRlcnJ1
cHQgcGluIHdpdGggYSBwdWxsLXVwLCBtYXJrIGl0IGFzIGEKd2FrZXVwIHNvdXJjZSwgYW5kIHBv
aW50IHRoZSBydGMwIGFsaWFzIGF0IGl0IHNvIFJUQ19IQ1RPU1lTL1NZU1RPSEMgdXNlCnRoZSBl
eHRlcm5hbCBjbG9jay4gV2lyaW5nIG1hdGNoZXMgUmFkeGEncyBkb3duc3RyZWFtIGJvYXJkIHN1
cHBvcnQuCgpTaWduZWQtb2ZmLWJ5OiBCcmlhbiBNYXllciA8YmxlZW1heWVyQGdtYWlsLmNvbT4K
VGVzdGVkLWJ5OiBCcmlhbiBNYXllciA8YmxlZW1heWVyQGdtYWlsLmNvbT4KLS0tCiAuLi4vZHRz
L3JvY2tjaGlwL3JrMzU4OHMtcmFkeGEtY201LWlvLmR0cyAgICAgfCAxOSArKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvcm9ja2NoaXAvcmszNTg4cy1yYWR4YS1jbTUtaW8uZHRzIGIvYXJj
aC9hcm02NC9ib290L2R0cy9yb2NrY2hpcC9yazM1ODhzLXJhZHhhLWNtNS1pby5kdHMKaW5kZXgg
YWY0YTliYzAxLi4xYTJjNzI4MzEgMTAwNjQ0Ci0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvcm9j
a2NoaXAvcmszNTg4cy1yYWR4YS1jbTUtaW8uZHRzCisrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
cm9ja2NoaXAvcmszNTg4cy1yYWR4YS1jbTUtaW8uZHRzCkBAIC0xOSw2ICsxOSw3IEBAIC8gewog
CWFsaWFzZXMgewogCQlldGhlcm5ldDAgPSAmZ21hYzE7CiAJCW1tYzEgPSAmc2RtbWM7CisJCXJ0
YzAgPSAmaHltODU2MzsKIAl9OwogCiAJY2hvc2VuIHsKQEAgLTE5OCw2ICsxOTksMTggQEAgdXNi
YzBfZHBfYWx0bW9kZV9tdXg6IGVuZHBvaW50IHsKIAkJCX07CiAJCX07CiAJfTsKKworCWh5bTg1
NjM6IHJ0Y0A1MSB7CisJCWNvbXBhdGlibGUgPSAiaGFveXUsaHltODU2MyI7CisJCXJlZyA9IDww
eDUxPjsKKwkJI2Nsb2NrLWNlbGxzID0gPDA+OworCQljbG9jay1vdXRwdXQtbmFtZXMgPSAiaHlt
ODU2MyI7CisJCWludGVycnVwdC1wYXJlbnQgPSA8JmdwaW8wPjsKKwkJaW50ZXJydXB0cyA9IDxS
S19QQjAgSVJRX1RZUEVfTEVWRUxfTE9XPjsKKwkJcGluY3RybC1uYW1lcyA9ICJkZWZhdWx0IjsK
KwkJcGluY3RybC0wID0gPCZydGNfaW50PjsKKwkJd2FrZXVwLXNvdXJjZTsKKwl9OwogfTsKIAog
JmkyczVfOGNoIHsKQEAgLTIyMSw2ICsyMzQsMTIgQEAgdXNiYzBfaW50OiB1c2JjMC1pbnQgewog
CQl9OwogCX07CiAKKwloeW04NTYzIHsKKwkJcnRjX2ludDogcnRjLWludCB7CisJCQlyb2NrY2hp
cCxwaW5zID0gPDAgUktfUEIwIFJLX0ZVTkNfR1BJTyAmcGNmZ19wdWxsX3VwPjsKKwkJfTsKKwl9
OworCiAJaGRtaSB7CiAJCWhkbWkwX3R4X29uX2g6IGhkbWkwLXR4LW9uLWggewogCQkJcm9ja2No
aXAscGlucyA9IDw0IFJLX1BCNiBSS19GVU5DX0dQSU8gJnBjZmdfcHVsbF9ub25lPjsKCmJhc2Ut
Y29tbWl0OiA4NzMyMGJlOWYwZDI0ZmNlNjc2MzFiN2VlZjkxOWYwYjc5YzNlNDVjCi0tIAoyLjU0
LjAKCg==
--00000000000057899e0655a58c94--

