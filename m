Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D320ECD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 02:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sHPUJ3czC5a2AiOeeio5W0mr8v8tHvSIXMOz+fsp+lA=; b=P++X7e9fXTHQOzNxqjNqf/X0OD
	OmExT8fPbCTOdcZ81Q1bmuiltiEMUsILIAElAR9+ZDYJkrbxtnfgjXlUowx7GatOcc1HXPGW3KjEG
	XSeZ8CJV6Iwy3iKxrzcY/XmAVR3m9/iU73Z1/52ooJbbTkDWgaDdeEeZTYMlLiH3TtnyoaKPditmi
	lBBP033l5kSDOfpfZ59WB7w1eRR6w9htvh1YhYYtXPwcpWRZwchsG1RTCbWXuxNElm7zACBvOXd4J
	xOzSwnK1fJGf/rd8wxWGZH7VyCHKGva2otPxlIw86shqTWKjIHzGjy75BJZA3xvy+Xk7Evl66wu7z
	Fv8owXdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQc8a-0000000CXDs-3e8l;
	Sat, 23 May 2026 02:30:52 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQc8T-0000000CXBU-3lwT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 02:30:47 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3699cdeec05so3315334a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 19:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779503445; x=1780108245; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHPUJ3czC5a2AiOeeio5W0mr8v8tHvSIXMOz+fsp+lA=;
        b=l9mJKVzTvS/ebfZc3uHIy9qjGA6QZ9XTNcCBA9UWBvTVzprdB2wACsf1MHjqQdMvBD
         4nMb38g5b0t0UUTZvIRlGnXjEVOZ1NKbOT5puhhn8HndeTIIl0QoK3VHg6eU7VGfz2lf
         RkBnYFPPStENGnlMgguTK5uppi54MsRojcKDk7eQGxm4secWMbSNY5l1sZcqQ8jaWngu
         L5cHevCQQFnS+PWTUAvtkz3me60/krabw9K26ZAy2IS6Bw0T+Ihc0z+ApEHF2+8MtMVv
         qflVRw27ksmwAOube9VQjXGRsj8X+u/fn2av6vreQoYiUrSFs1ugA1E+4khk0iSPs0sf
         yFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779503445; x=1780108245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sHPUJ3czC5a2AiOeeio5W0mr8v8tHvSIXMOz+fsp+lA=;
        b=llkmxskIkqRHrpoPff/pECA8Fb5vqruaP4QLUbg2Mz5EMKU1htjcqZRrtiknMEMpiH
         3U90V/i6i/Xalnnsa58bbUD9o6W4lSw8j89QM+BUI5lZmElbNwtLwoxoWZ62DG09uskB
         Rs2vC5z2s2Ky1yAIQCuEQliuLu5H6shRW0MV/UYnb1hNyIrtceLpFsBLEuCcViROVNJt
         FJxown3Bm74+pn7WKAhdFZ8icv606CRhgBXZGSBjD/c0YCaxx3IjxPG0ejiGYmZw50NX
         nv9rdq9PaXzKjwkXKjGesCRM1bv+c2cJwWW/o3xnnhkkRNCxBCURBwHAe7OtghK6Mu4/
         2EWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/P3NwLzuwBY/d/D9Mw5+UYsCTkEYURL4/kv+Y+pPTsWxw+/mbOVdKY4Ac5Onp/cXL2KVJU8OhFmeJ5FVXmprDU@lists.infradead.org
X-Gm-Message-State: AOJu0YxrcQ4s7ONS+cliIlY2SxsL9pVzbvST4A1HbPNIO0RopEfT/ZRV
	sBXnq7cbbunx6vOi9q0liB9FhlTHj+u3CF86lOWMzxM8Z+IDIsjNmIcJ
X-Gm-Gg: Acq92OGx/Kkp0B8nsp+s6X1kPj8w6HBPMtuYlIrI9KPITY61tjdlIZAyg5pdyE5ap7F
	5rYFhCMcYbmxjGgwKaYIx1pr5T7MltGHH3vFlfAZHeR0ZQG2sXIeHdwFezJq2NmpaeGX+sJj2uY
	hrcC2zOpXZnHiIwPWLwK4SPYFFiw2pDGkh5g/CrBo417GqmiXskJd1v6ZHgRwu8Xya48OK40uGb
	RaZ3gcFnHV6Jh5eIVBYMFHY6INrjpbILgTfznxjGlgl2musz7OpXZAxGmydHqmEWml1V7ieAhSQ
	USaiJFAUhywr/xX0p5XasMxRt4exRCLKoGeHjl4i0DEMJ0Jz78crlR+YoNH9y8Gqn+IeBaocXFC
	22Hvp7En21WbrwCet+3AtjrDLwwLQb94bUa+H3Kd/hcByOpQfBbtf+s0o0nguXzSUFjJWZXqRmp
	6NzetkqGukj5X+JzB6O3XDslmRS2whD/wXTzZQMYEYbK774IaaALGCNevwmoVYpZhj3g==
X-Received: by 2002:a17:90b:2f83:b0:369:e4d4:7460 with SMTP id 98e67ed59e1d1-36a6784d120mr6270352a91.21.1779503444976;
        Fri, 22 May 2026 19:30:44 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71d944c4sm3010287a91.1.2026.05.22.19.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 19:30:44 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
Date: Sat, 23 May 2026 10:28:08 +0800
Subject: [PATCH 2/2] ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT
 linename
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-potin-update-sanmiguel-dts-20260522-v1-2-169f5fceb5f9@quantatw.com>
References: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
In-Reply-To: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>, Potin Lai <potin.lai@quantatw.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779503436; l=1342;
 i=potin.lai@quantatw.com; s=20260522; h=from:subject:message-id;
 bh=Q4E3ZBST3Q3ly34aY2FsZlQq16jx0NpfboLmFcFmWh0=;
 b=Ruc+O4VL0C7Z8Ul8A7X6wFf74EjrJxDSMlytQIRn/OlyWuyYFoLNzwlw/mw93ArtJMjKo7bJ7
 HOfUx0FVyttDLIBwrTXOHZ490kWWtc7AqhVgNJDr5A4ZiBF7wLIJ0VE
X-Developer-Key: i=potin.lai@quantatw.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_193045_946738_E4E16851 
X-CRM114-Status: GOOD (  10.86  )
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

Fix the GPIO linenames for CPU_CHIPTHROT signals.

The signals were incorrectly marked as output ("-O") while they are
actually input signals ("-I").

- B0_M0_CPU_CHIPTHROT_L-O -> B0_M0_CPU_CHIPTHROT_L-I
- B1_M0_CPU_CHIPTHROT_L-O -> B1_M0_CPU_CHIPTHROT_L-I

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index 61dbef45f8b0..d7ed497d7227 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -224,7 +224,7 @@ hpm0_ioexp_20: gpio@20 {
 			"B0_M0_LEAK_DETECT_ALERT_L-I",
 			"B0_M0_RUN_POWER_EN-O",
 			"B0_M0_RUN_POWER_PG-I",
-			"B0_M0_CPU_CHIPTHROT_L-O",
+			"B0_M0_CPU_CHIPTHROT_L-I",
 			"B0_M0_SHDN_REQ_L-O",
 			"B0_M0_CPU_SHDN_OK_L-I",
 			"B0_M0_CPLD_READY-I",
@@ -398,7 +398,7 @@ hpm1_ioexp_20: gpio@20 {
 			"B1_M0_LEAK_DETECT_ALERT_L-I",
 			"B1_M0_RUN_POWER_EN-O",
 			"B1_M0_RUN_POWER_PG-I",
-			"B1_M0_CPU_CHIPTHROT_L-O",
+			"B1_M0_CPU_CHIPTHROT_L-I",
 			"B1_M0_SHDN_REQ_L-O",
 			"B1_M0_CPU_SHDN_OK_L-I",
 			"B1_M0_CPLD_READY-I",

-- 
2.52.0


