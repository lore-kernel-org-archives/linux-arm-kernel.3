Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E95AC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rV1XgPNoXlxuVA1alm8N8QB10UHZNje3da5SMs3oTjs=; b=02jIPrt8Hy27BZGE1OURqGueeA
	RQ+g5jGec60doYH2aHIghMliYCdyEeukp+TFZzS2REpoam/CwoVbMexfoighdRj5If5iyud0zix5B
	7Dgv54VEj4iSaLiqS8CXM696wnk13uYGH8/2maW5pRnWFk2aOBffCXXefMCajVYK9mi+QLDe2feU7
	BoalnXrdnh8wY6WFi2CN0zkgXWoUmprPwJ0OFdhZGAH+JhQ9DBT//I+EGMq75Z+igcA6aOoPiwU94
	Aa+EoqjUJ53aPdQ2M26z/2rQep9fBhvl69Z8sI87X7a7UJvOjbfznQybu062qPrUsw+wzbtisx46L
	ZfJUrdiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBtSc-000000075XR-1UCX;
	Mon, 05 May 2025 10:54:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBtQd-000000075PN-3yIf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 10:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746442325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=rV1XgPNoXlxuVA1alm8N8QB10UHZNje3da5SMs3oTjs=;
	b=ELsZ6dZrkPxVuafkOE5TgGc5icr+GErCOgYFJsLpqtFR3dQl+6fA6fZoIGsX2pHzyHGNbx
	EhmhzOenfNBY4WEf7GD6mpR5hQ39N0xN3CjoC8FKk5271JkdfE2NC5NSjNBYRNS5XLJ2q2
	64wxAOGEt765FUZfCoeJD4RjtHifmHA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-ePgzjM4pN-WGJEOU9XJAlA-1; Mon, 05 May 2025 06:52:04 -0400
X-MC-Unique: ePgzjM4pN-WGJEOU9XJAlA-1
X-Mimecast-MFC-AGG-ID: ePgzjM4pN-WGJEOU9XJAlA_1746442323
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39c184b20a2so1188633f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 03:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746442323; x=1747047123;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sq8oqpkEbt6VQZ1/grnXYkgovjqr9Z/hWjCihFBzl8g=;
        b=V21+bWy2UkqVx1L2VJnyLAzvl0uG+Jxb+SAYOOmyTNMbvbMXgE1RfdCNyOC/QkhYvO
         l9SZnSTzugzUf1nzSYERbEEfZWBbze+bq3Eb+74yDLJOgwq3Jq19SBYzqp9J8YWlrcPH
         tP8PTMSFguK4JxuRZb3Soi9c99l8ugRMTBShQ8TKcSizxijcE+io+fi+lUQKD5OgLApD
         E7Qy+5aP1t8JsFMwczHmtrbb63jeS+2FbEN0hAQ3Ke7aq1C2UetiEqq4atqa/d89ix89
         2ulL1ZnCzAw2r/oLi/WoSG55CesKvORZz85Kh+PoHHaMc0M0aHslt/KbZssEPlTcJx2P
         fsFg==
X-Forwarded-Encrypted: i=1; AJvYcCU3H2c+a1O9EqRbdSfDZrGJh6ZLiLceCZm5gNnkXHvY3kvkTibz1Cz0H8OdfTOPFuRGxjO0J/f3DmeG/QFE2Sz3@lists.infradead.org
X-Gm-Message-State: AOJu0YyCXP9CvSrzc9hl+ldZq+uA25Td4mXpUzR8oxZnCJNT3JF6UpNT
	d+OtC8TB90VcxYhKrvOUa2/Vd4BPPwwUjQJgvBnWQGP3VpmIOzuzpDekq3vwaA5XXb3PS1TWuMr
	6frDTlioJ+buGt3+tk1ZxDbuch/X/d2gtFtpp8iPF0GFvsWU/fEXkhKA/+WA3ViwJy02USqxs
X-Gm-Gg: ASbGncuFgjEe/Tt7VxLN6O8QXu5simcuPOjUKwitge0PhlXVDnse237cek5pa9ZMCxP
	MOCl9caoEtSKib6O0dEnDqLqYhFWJgP639Fbv371ZhWQwAJcjkOzQ3V+qgbm8LI9iUvI1uMz4kJ
	19mE1Czg9gSn5GKs0/S/GmYlGRaUC06VBMGgDie3R7s9wwSZbCN3/pWFNJAxVwcjrYv2987NpH9
	MYtir3HkilQCORjUwzG1qrOOwpJA8vocnOWuZfLLdc9Iaokp6ztxqipEFN+/xN0ZNomEufgobD/
	GhpiEee7gsqULYDrLbpMYBikLrR7UsHvbFC8NApbXk0UB51rY9j2YqjlU9gi
X-Received: by 2002:a5d:584a:0:b0:39c:1424:2827 with SMTP id ffacd0b85a97d-3a09fd72d2fmr5235995f8f.15.1746442322925;
        Mon, 05 May 2025 03:52:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGavxMvTs7adVpf3ebEvODcNsebFSIFRc5x5LOjIYUhYTGyIAbpQGLg5qpK8yqHQ/F0lIAlRQ==
X-Received: by 2002:a5d:584a:0:b0:39c:1424:2827 with SMTP id ffacd0b85a97d-3a09fd72d2fmr5235976f8f.15.1746442322542;
        Mon, 05 May 2025 03:52:02 -0700 (PDT)
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a09a002899sm9624936f8f.0.2025.05.05.03.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 03:52:02 -0700 (PDT)
Date: Mon, 5 May 2025 12:52:00 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
    Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>
cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: LM regression: fce886a60207 KVM: arm64: Plumb the pKVM MMU in KVM
Message-ID: <3f5db4c7-ccce-fb95-595c-692fa7aad227@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yu98zLtpRmmZbe6x0iDDQKh52aURxAayJ6jlI0fWL-g_1746442323
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="-1463806286-1042922980-1746442321=:11509"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_035208_063974_D4B6D4D8 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463806286-1042922980-1746442321=:11509
Content-Type: text/plain; format=flowed; charset=US-ASCII

Hey,

Doing back and forth migrations currently fails on arm after a couple iterations.
During the failing migration KVM_RUN exits via guest_abort and returns -ENOMEM.
I can reliably reproduce this by migrating between 2 qemu instances on an ampere
altra machine. This fails after < 5 iterations. In this case qemu would spit out
smth like this (other than that - nothing in the logs):

error: kvm run failed Cannot allocate memory
  PC=0000aaaae7d48590 X00=0000aaaae80a2e00 X01=0000aaaae7ea2fc0
X02=0000000001d3a5d0 X03=0000aaaae7eace8c X04=000000003b9aca00
X05=000000000000004a X06=000000000000004a X07=0000000028000000
X08=0000000000001d70 X09=0000000000000018 X10=000144b7d0000000
X11=00ffffffffffffff X12=000000008378f367 X13=0000aaab1a202d70
X14=0000000000000000 X15=0000000000000000 X16=0000ffffa2e2f7a8
X17=0000ffffa2541f20 X18=000000000000a000 X19=84bfda6288cf2dd6
X20=0000aaab1a1f1ce0 X21=000000007fffffff X22=0000ffffc5431788
X23=0000aaab1a17db60 X24=0000ffffc5431770 X25=0000000100000000
X26=0000004100000000 X27=0000000000000001 X28=0000aaab1a1f1c20
X29=0000ffffc54316d0 X30=0000aaaae7f8cd24  SP=0000ffffc5431650
PSTATE=20001000 --C- EL0t

Guest and host are otherwise idle, kvm is in normal VHE mode.

Git bisect points to (fce886a60207 "KVM: arm64: Plumb the pKVM MMU in KVM")
I also double checked that by reverting this commit on top of 6.14.

Sebastian
---1463806286-1042922980-1746442321=:11509
Content-Type: text/plain; name=bisect.log
Content-Transfer-Encoding: BASE64
Content-ID: <7f7f94bd-ec02-d458-7ef4-4859ab216191@redhat.com>
Content-Description: 
Content-Disposition: attachment; filename=bisect.log

Z2l0IGJpc2VjdCBsb2cNCiMgYmFkOiBbMzhmZWMxMGViNjBkNjg3ZTMwYzhjNmI1NDIwZDg2ZTgx
NDlmNzU1N10gTGludXggNi4xNA0KIyBnb29kOiBbZmZkMjk0ZDM0NmQxODViNzBlMjhiMWEyOGFi
ZTM2N2JiZmU1M2MwNF0gTGludXggNi4xMw0KZ2l0IGJpc2VjdCBzdGFydCAnYmFkJyAnZ29vZCcN
CiMgZ29vZDogWzJjOGQyYTUxMGMxNWMwMDM3NDllNDNhYzJiOGUxYmM3OWE3YTAwZDZdIE1lcmdl
IHRhZyAnc291bmQtNi4xNC1yYzEnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGlu
dXgva2VybmVsL2dpdC90aXdhaS9zb3VuZA0KZ2l0IGJpc2VjdCBnb29kIDJjOGQyYTUxMGMxNWMw
MDM3NDllNDNhYzJiOGUxYmM3OWE3YTAwZDYNCiMgZ29vZDogWzlmZjI4ZjJmYWQ2N2UxNzNlZDI1
YjhjM2ExODNiMTVkYTU0NDVkMmRdIE1lcmdlIHRhZyAnbG9vbmdhcmNoLTYuMTQnIG9mIGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaGVuaHVhY2FpL2xpbnV4
LWxvb25nc29uDQpnaXQgYmlzZWN0IGdvb2QgOWZmMjhmMmZhZDY3ZTE3M2VkMjViOGMzYTE4M2Ix
NWRhNTQ0NWQyZA0KIyBiYWQ6IFsyNDM4OTkwNzZjM2VmZGY5OGQ4ZTkyMmE4MDI4OTY0MjRhNTk3
NTgwXSBNZXJnZSB0YWcgJ3J1c3QtZml4ZXMtNi4xNC0yJyBvZiBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvb2plZGEvbGludXgNCmdpdCBiaXNlY3QgYmFkIDI0
Mzg5OTA3NmMzZWZkZjk4ZDhlOTIyYTgwMjg5NjQyNGE1OTc1ODANCiMgYmFkOiBbOTVkN2U4MjI2
MTA2ZTM0NDViMGQ4NzcwMTVmNDE5MmM0N2QyMzYzN10gTWVyZ2UgdGFnICdhdGEtNi4xNC1yYzEt
cGFydDInIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9s
aWJhdGEvbGludXgNCmdpdCBiaXNlY3QgYmFkIDk1ZDdlODIyNjEwNmUzNDQ1YjBkODc3MDE1ZjQx
OTJjNDdkMjM2MzcNCiMgYmFkOiBbN2M3NzVjNjA1NmQwN2ViNzc3ZjM3YzdhYzEzNDAxMTViMjdk
YzlmOF0gTWVyZ2UgdGFnICdkbWFlbmdpbmUtNi4xNC1yYzEnIG9mIGdpdDovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92a291bC9kbWFlbmdpbmUNCmdpdCBiaXNlY3Qg
YmFkIDdjNzc1YzYwNTZkMDdlYjc3N2YzN2M3YWMxMzQwMTE1YjI3ZGM5ZjgNCiMgYmFkOiBbN2M3
NzVjNjA1NmQwN2ViNzc3ZjM3YzdhYzEzNDAxMTViMjdkYzlmOF0gTWVyZ2UgdGFnICdkbWFlbmdp
bmUtNi4xNC1yYzEnIG9mIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC92a291bC9kbWFlbmdpbmUNCmdpdCBiaXNlY3QgYmFkIDdjNzc1YzYwNTZkMDdlYjc3N2Yz
N2M3YWMxMzQwMTE1YjI3ZGM5ZjgNCiMgYmFkOiBbZjc4NTY5MmZmNTQ1YWVjYjUxN2QyNjA5ODY0
ZTFjNmQ4MzgzMjllNl0gTWVyZ2UgdGFnICdzdG9wLW1hY2hpbmUuMjAyNS4wMS4yOGEnIG9mIGdp
dDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wYXVsbWNrL2xpbnV4
LXJjdQ0KZ2l0IGJpc2VjdCBiYWQgZjc4NTY5MmZmNTQ1YWVjYjUxN2QyNjA5ODY0ZTFjNmQ4Mzgz
MjllNg0KIyBiYWQ6IFswODA2MTJiMjk0MmFiNzk0NzMwMzAyOWUxZmEzMzExN2I1MjgwZWNlXSBN
ZXJnZSBicmFuY2gga3ZtLWFybTY0L252LXRpbWVycyBpbnRvIGt2bWFybS1tYXN0ZXIvbmV4dA0K
Z2l0IGJpc2VjdCBiYWQgMDgwNjEyYjI5NDJhYjc5NDczMDMwMjllMWZhMzMxMTdiNTI4MGVjZQ0K
IyBiYWQ6IFtkMDY3MDEyOGQ0MmZhMTcwYmY4YmE4NzhjZDIzNTA0YzVjNWNjY2M3XSBNZXJnZSBi
cmFuY2gga3ZtLWFybTY0L3Brdm0tbnAtZ3Vlc3QgaW50byBrdm1hcm0tbWFzdGVyL25leHQNCmdp
dCBiaXNlY3QgYmFkIGQwNjcwMTI4ZDQyZmExNzBiZjhiYTg3OGNkMjM1MDRjNWM1Y2NjYzcNCiMg
Z29vZDogW2M0YTZlZDg1NDU1OTc5ZWYzZmJhZGMyZjFiZGYxODczNGIwZWNlYTZdIEtWTTogYXJt
NjQ6IFByb21vdGUgZ3Vlc3Qgb3duZXJzaGlwIGZvciBEQkd4VlIvREJHeENSIHJlYWRzDQpnaXQg
YmlzZWN0IGdvb2QgYzRhNmVkODU0NTU5NzllZjNmYmFkYzJmMWJkZjE4NzM0YjBlY2VhNg0KIyBn
b29kOiBbZDBiZDNlNjU3MGFlZTQyNzY2ZTdiZDg4NDczNGFlMDc4NjY3ZWExZV0gS1ZNOiBhcm02
NDogSW50cm9kdWNlIF9fcGt2bV9ob3N0X3NoYXJlX2d1ZXN0KCkNCmdpdCBiaXNlY3QgZ29vZCBk
MGJkM2U2NTcwYWVlNDI3NjZlN2JkODg0NzM0YWUwNzg2NjdlYTFlDQojIGdvb2Q6IFs3NmYwYjE4
YjNkYjU3ODY4ZmIwY2FiZTY5MTIwMWFhZDMwODViNzEyXSBLVk06IGFybTY0OiBJbnRyb2R1Y2Ug
X19wa3ZtX2hvc3RfbWt5b3VuZ19ndWVzdCgpDQpnaXQgYmlzZWN0IGdvb2QgNzZmMGIxOGIzZGI1
Nzg2OGZiMGNhYmU2OTEyMDFhYWQzMDg1YjcxMg0KIyBnb29kOiBbZTkxMmVmZWQ0ODVhNGM1MGJk
YzM5MzRhZTY0N2UyNTdlZjU2OGVmNl0gS1ZNOiBhcm02NDogSW50cm9kdWNlIHRoZSBFTDEgcEtW
TSBNTVUNCmdpdCBiaXNlY3QgZ29vZCBlOTEyZWZlZDQ4NWE0YzUwYmRjMzkzNGFlNjQ3ZTI1N2Vm
NTY4ZWY2DQojIGJhZDogW2ZjZTg4NmE2MDIwNzM0ZDYyNTNjMmM1YTNiYzI4NWUzODVjYzU0OTZd
IEtWTTogYXJtNjQ6IFBsdW1iIHRoZSBwS1ZNIE1NVSBpbiBLVk0NCmdpdCBiaXNlY3QgYmFkIGZj
ZTg4NmE2MDIwNzM0ZDYyNTNjMmM1YTNiYzI4NWUzODVjYzU0OTYNCiMgZmlyc3QgYmFkIGNvbW1p
dDogW2ZjZTg4NmE2MDIwNzM0ZDYyNTNjMmM1YTNiYzI4NWUzODVjYzU0OTZdIEtWTTogYXJtNjQ6
IFBsdW1iIHRoZSBwS1ZNIE1NVSBpbiBLVk0NCg==
---1463806286-1042922980-1746442321=:11509--


