Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67620C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 21:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wg1lA3IZ3q4wxQ5pM0sN/8lXutNm00FGJuuGk/CKpII=; b=QePENKTZWhF6d6ZIIJV/VutALx
	mt5mThax5OoUh/DYhlVrJ9YZWcdJmLvlo7QHnBd22kaG+ZhJTWh3CCHKtggWntyPm5FxJEl/GAZGe
	TFafnZBdIbbo+bXfGwDMgSr5vLzfyJ4FLnUINHASk/hr43mSFmnAwzdEmAbWOJF1R8DyZ4eXoosj3
	gfxWaRzFiIY9bhrofQ2uMDkveCNhgx5asr3f41aI87izinoyKw5EwWZn7eTJiLf70ql5VINDZelDf
	OFw8TBGJxrZvdpBHy3Sp8p/oLEH2LS04MMxzKN/3mGgr6alCo3/KtUHF8kx6ZLgGcJED4zE/8MhiT
	eKwgaBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJu6-00000008rF0-0r8O;
	Wed, 12 Feb 2025 21:04:18 +0000
Received: from mail-ej1-x663.google.com ([2a00:1450:4864:20::663])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiJs9-00000008qyK-1ud8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 21:02:19 +0000
Received: by mail-ej1-x663.google.com with SMTP id a640c23a62f3a-ab7f9d87b96so32425166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 13:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=patrick-wildt-de.20230601.gappssmtp.com; s=20230601; t=1739394135; x=1739998935; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wg1lA3IZ3q4wxQ5pM0sN/8lXutNm00FGJuuGk/CKpII=;
        b=lURWE7x/hMDBOqu4PK1FORz72dgLVTDCuglei/V+XA383HOJgdCErQBYnHF8iZPsfS
         c3cQrkhoyWFbxlqs/qOQ0fnmBd2qQkmers++z5TIJ+Sd234ujSD+5uRN0WmjR4ulm2GJ
         gQCM6mAw/Qo26TQMh4Z4ssKA/ZdV57e9N4KLvDllhBfCFBcjwMGFxCXGUNdc4l93JQOE
         JyKOVZdY5R61j9xxgb6Dtjk9GRjv/LEMNLWeVm4PcYk/tuiuUzkTkk7RobU3w9VPINRg
         uKqlruAIUlDnOBfGaL38Y6mFal2iw+HuxWlH+LF7BMDpzJrX/y38hJQVVaIgUyxCsyMe
         786w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739394135; x=1739998935;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wg1lA3IZ3q4wxQ5pM0sN/8lXutNm00FGJuuGk/CKpII=;
        b=VijO+cXRiqtqrevwxMJGqTB/jh/5G2SugUCOTxZHAB9FGUeqYfvgNc3PtxsEBKfY/X
         yIqNghxvbTfvAorxS6XmmYmPIBNcx7lWQIqzoqxYX0YD7G+4I1qCBYSd1fn/KbF6ydmo
         iLfHbfzH4FXPIzcNlf5OvMerwxe28qISYQc5oLGodx7pEHrc2MpZIxKuLGP5IqSCrgMi
         bMwVpzt1uZkKpfv8Isf25J9qZ4V64Rn5RockvHYJh6ZE158F2vmpqhCbYQSEF/X03Wr9
         FrykW4qgbJomSsPh/KFmIYip9k24OOTG6sjaqlF/xZ0oy0N/DUwD3j2LNXg9vn1cz84Q
         Rh2Q==
X-Gm-Message-State: AOJu0YzKrMbTDFRk6VRGwuJXzs85qWetj6CLS1xiLEhVGK2vyu9V1V0U
	b1R1KxMVQuWqk7PPjHzbiYlJ+1u+1mt4ZqYsZZxzZkdymxqriUimcWBUJNcIuVWsRX7oRxn4av8
	8Pp1EcnQj+8zaSEGwsSXHPVA+ecGlmrpQ
X-Gm-Gg: ASbGncv7Wab40qBtQiASqS4Me/AczHvGa1jyLOe6Ii8Ogpf4iMcwss/8/EUWMHiin9Y
	4h4OZSa9FKHV3yDsnbwSG5DQJDcPmSoHtAQP6bb0Yn56aaINoMhxmAnQw0g/kuPFvjX/XfoR+Ah
	kyHyM3Bssk8bUPN790Kb0wFCIjT+Yj2YkjRN1DlB5EV0aTjehHdWnudNsZzurnFWdV3zj0Alxgp
	QtrXXR6g5ahGS7s336Q/7FGlTq3xH7F3/20E/Hb/vcHXTXfH/XOXS6L/o2VfFu96+89GhwXYIra
	KcSx0m0zfvdhjUNDKYuGFV2eaQ+tRiFU
X-Google-Smtp-Source: AGHT+IHqpvPQzdr9MAcycXbgI5nsdbZRNkyWMAN8JIQg9N+hkFcqx1Z+xzJ39++U7UI2g43v+TQUi47WEl0G
X-Received: by 2002:a17:907:94c5:b0:ab7:c6f4:9529 with SMTP id a640c23a62f3a-ab7f33781f4mr515355266b.7.1739394134643;
        Wed, 12 Feb 2025 13:02:14 -0800 (PST)
Received: from windev.fritz.box (pc19f8e2d.dip0.t-ipconnect.de. [193.159.142.45])
        by smtp-relay.gmail.com with ESMTPS id a640c23a62f3a-ab7e3ec7281sm23009066b.92.2025.02.12.13.02.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Feb 2025 13:02:14 -0800 (PST)
X-Relaying-Domain: blueri.se
Date: Wed, 12 Feb 2025 22:02:11 +0100
From: Patrick Wildt <patrick@blueri.se>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add MNT Reform 2 (RCORE)
Message-ID: <Z60MU05JLtI9VzuU@windev.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_130217_618669_3CBE6477 
X-CRM114-Status: UNSURE (   8.95  )
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

Document board compatible bindings for the MNT Reform 2 with it's RCORE
SoM, which is based on Firefly's iCore-3588Q.

Signed-off-by: Patrick Wildt <patrick@blueri.se>
---
Changes for v3:
- Split DT as it's based on a Firefly iCore-3588Q SoM
Changes for v2:
- No changes

 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 522a6f0450ea..e21c5c8fc2a3 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -178,6 +178,13 @@ properties:
           - const: engicam,px30-core
           - const: rockchip,px30
 
+      - description: Firefly iCore-3588Q-based boards
+        items:
+          - enum:
+              - mntre,reform2-rcore
+          - const: firefly,icore-3588q
+          - const: rockchip,rk3588
+
       - description: Firefly Core-3588J-based boards
         items:
           - enum:
-- 
2.48.1


