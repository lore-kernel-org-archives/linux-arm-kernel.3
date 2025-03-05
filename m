Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FADDC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqdSTt2FRKV/rdzSsxvtYL3VjKNAZZPUvxCgkaQgdZ4=; b=v/+x/73ruX3TLVfHyWZE/nrlTM
	9RK5BL4MKHuCQje1Xo+LgbNP1hVXyqj5bm8Cwp3dMCjkVXRUc41krs+EKLAHPZPkYPrxQR7mZo9qt
	uHNrxD6WlVc2Vjo6xmRkPP5ZHjeLTmny3tLlzMqoF4YKg30yoNnPJi8yxM5Aa4vP0KTqIcOQjgZzO
	jMw+/v8AV09eejYCB6fGWM3aQ2MOlYfuETOPdEqv6Q67Leh3V84pMlH+L/nKH+7nurLCtlpny9h+z
	vU08nXBCxwnJ5joozDPxLmtpVFoQ48ET2QIIMKGeLmGWXbSo5Z041leo480xVpvZWouu173tnCQj0
	2QsDLiJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmqw-00000007qUQ-0XVg;
	Wed, 05 Mar 2025 11:23:54 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm18-00000007gWM-03J1;
	Wed, 05 Mar 2025 10:30:23 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-ac21c5d0ea0so34049066b.2;
        Wed, 05 Mar 2025 02:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170620; x=1741775420; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqdSTt2FRKV/rdzSsxvtYL3VjKNAZZPUvxCgkaQgdZ4=;
        b=jj2Py1YFIAOn2vlECFFF5zMwaJkUO/A1QegRklW1qAS1Y7Wg7TzQm5RZQYczJQHqXJ
         qgANfuEsaXANXcir1Wp/PGDNyGfteGIm3BfssTGvAg3EGSYvGVP1k/vns+f/BYXV0M7/
         dkseoi8KcX3kjtPeLTB/HKem5JdYOP0rW2Z4J5JDkVk9OVaBlsQ/tKUnwk2Xbr1heUiJ
         lvn2VdN4nWsV3s+FlLSL71jlJS8D609wO2BJw/JXBaTLsMIeLlbmKsyd22Ak5pCVq7WH
         2W8JVBDlGwzKJPxc1ZRfyI5j6WH17NmyO93jdXcvNu23d9zN64DOt7x1xe8ZMt8BE+ES
         qHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170620; x=1741775420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqdSTt2FRKV/rdzSsxvtYL3VjKNAZZPUvxCgkaQgdZ4=;
        b=HnwwrhUqCczeGrm5pVetNQsx3j5O+14PE0PN+Wg8jClWzumoZdAMdrKP3TUYpDI4tA
         NlS1ihUjT1QtwRewXK7q75u5Uo+dRLkXzU4UAsMqdM+bE8nTgpL7jkm3q0YXMxynsf83
         ExguibNsvkCwRD7Gu+dol0Z7f3LJUOkcf3yIpnHrKvat1Bqray7hVQXWMBZXfOk61X/V
         gH7lLsJqD6UoATwh8s+gbSrZ8TotsPK6jp+LkrqiqNKaYIzYqE6ID17FEMHJw5mLSDpD
         DXQoYzSGlzAPGKStd+SWSo1x8qL5RQVXensF2zhtGOA1Cr6/55S6XzryhQTQzDdTZPKX
         pOBg==
X-Forwarded-Encrypted: i=1; AJvYcCUtN6BfR2w/VlDobi4vECROCoK2AF2C04k9NzNNcM5/SBKF03zBA/Wla08P0XwQFIBt4GIKBgwRhjMIIwM4YT8=@lists.infradead.org, AJvYcCUxFIKxLmqhWQMccUaGB6Gn4Qc3V76k6M69yMtllUOFkGS/b4WZWNw/yhkGcUtqg4BRIchYY3RYnoXIhBxmcYbA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3+i6J8tnXOYr5qS7IR7kPpDSmRE1EU23mUzMv1PruAU/K/XQe
	tpe/VDV9zWqTxjhParBefMOam/vXhGwBMA+xJvFtH7UsUmgpcScU
X-Gm-Gg: ASbGnctMubo2On886s+earo7wRGLepH4JUEMlAfVo6URB2tJvNLjuk5VOg9rdQQLzRz
	zOuuOJpn1/5ePjc+/z+AsUEzYcGD89xGs74IhydaRAfemWsujjZek7ittjS4cNnNeDD5h6sCifc
	Xut6N4rYpDinm2UZ4H1lvmOizcriJMqvtvR1mdSDTobX+mSxyXVSRLZuqwHt82zSdoZKs+ZxveJ
	NI8lvXBDjwk0HkaysvpfWpt43YLLb362BH29pNRe8m3kxIrRUB+hnEr1kVntyHum37R1935JrXs
	Ti6rSqQE23lxrAyzUYIsR3Bv78dymcu1jypqdVhaFOFcUVbf1ql4CG+1z5m7+BKfcqjGq4EoyGd
	BesmOPeKlTfQtZfcmjnAbKEWD2iT+/8FtFpgKNJdi9L1xiVAJfA3i103WpvUL4w==
X-Google-Smtp-Source: AGHT+IEyEAbGkolCRetfSsPG/N4aNUq3eQAwNjiWAcgniXnsiF//es41+w34cXFkZ+c7lQRDgQiBdA==
X-Received: by 2002:a05:6402:274a:b0:5e4:92ca:34d0 with SMTP id 4fb4d7f45d1cf-5e59f47f014mr5890447a12.20.1741170620303;
        Wed, 05 Mar 2025 02:30:20 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f7161a4esm247154266b.161.2025.03.05.02.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:30:19 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ahmed Zaki <ahmed.zaki@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Frank Wunderlich" <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v9 nf 14/15] bridge: Introduce DEV_PATH_BR_VLAN_KEEP_HW for bridge-fastpath
Date: Wed,  5 Mar 2025 11:29:48 +0100
Message-ID: <20250305102949.16370-15-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305102949.16370-1-ericwouds@gmail.com>
References: <20250305102949.16370-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_023022_049319_778C887A 
X-CRM114-Status: GOOD (  15.52  )
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

This patch introduces DEV_PATH_BR_VLAN_KEEP_HW. It is needed in the
bridge fastpath for switchdevs supporting SWITCHDEV_OBJ_ID_PORT_VLAN.

It is similar to DEV_PATH_BR_VLAN_TAG, with the correcponding bit in
ingress_vlans set.

In the forward fastpath it is not needed.

Acked-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 include/linux/netdevice.h        |  1 +
 net/bridge/br_device.c           |  4 ++++
 net/bridge/br_vlan.c             | 18 +++++++++++-------
 net/netfilter/nft_flow_offload.c |  3 +++
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 81cdad85d9f1..1e2f519e8802 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -887,6 +887,7 @@ struct net_device_path {
 				DEV_PATH_BR_VLAN_TAG,
 				DEV_PATH_BR_VLAN_UNTAG,
 				DEV_PATH_BR_VLAN_UNTAG_HW,
+				DEV_PATH_BR_VLAN_KEEP_HW,
 			}		vlan_mode;
 			u16		vlan_id;
 			__be16		vlan_proto;
diff --git a/net/bridge/br_device.c b/net/bridge/br_device.c
index 02eb23e8aab8..55c64a1d2758 100644
--- a/net/bridge/br_device.c
+++ b/net/bridge/br_device.c
@@ -430,6 +430,10 @@ static int br_fill_forward_path(struct net_device_path_ctx *ctx,
 	case DEV_PATH_BR_VLAN_UNTAG:
 		ctx->num_vlans--;
 		break;
+	case DEV_PATH_BR_VLAN_KEEP_HW:
+		if (!src)
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
+		break;
 	case DEV_PATH_BR_VLAN_KEEP:
 		break;
 	}
diff --git a/net/bridge/br_vlan.c b/net/bridge/br_vlan.c
index aea94d401a30..114d47d5f90f 100644
--- a/net/bridge/br_vlan.c
+++ b/net/bridge/br_vlan.c
@@ -1494,13 +1494,17 @@ int br_vlan_fill_forward_path_mode(struct net_bridge *br,
 	if (!(v->flags & BRIDGE_VLAN_INFO_UNTAGGED))
 		return 0;
 
-	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG)
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
-	else if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
-	else
-		path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
-
+	if (path->bridge.vlan_mode == DEV_PATH_BR_VLAN_TAG) {
+		if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP_HW;
+		else
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_KEEP;
+	} else {
+		if (v->priv_flags & BR_VLFLAG_TAGGING_BY_SWITCHDEV)
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG_HW;
+		else
+			path->bridge.vlan_mode = DEV_PATH_BR_VLAN_UNTAG;
+	}
 	return 0;
 }
 
diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index c95fad495460..c0c310c569cd 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -148,6 +148,9 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 			case DEV_PATH_BR_VLAN_UNTAG_HW:
 				info->ingress_vlans |= BIT(info->num_encaps - 1);
 				break;
+			case DEV_PATH_BR_VLAN_KEEP_HW:
+				info->ingress_vlans |= BIT(info->num_encaps);
+				fallthrough;
 			case DEV_PATH_BR_VLAN_TAG:
 				info->encap[info->num_encaps].id = path->bridge.vlan_id;
 				info->encap[info->num_encaps].proto = path->bridge.vlan_proto;
-- 
2.47.1


