Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F649C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVAkTZii1Gy4XRugZsnKaWDIV+1UdUIxS1E1wVQkwnU=; b=ONgn5dYfNT6lFKXGOCaeVLlKTu
	VCtq57qnA2feYKMsQYc2DCndY14A+RFhKanQhN97KfCV/7iuYme9BGR9s2Xj+gnobMSZxl6exxFIO
	pKtm0h0V/R3yxLc+hsqFeS6R8hBxDFNvArg5Nj3pafZAXY6b8EyQziB7ene65XQqw1zISi54yMhUt
	o1T0lYA1XGndBt+EwB7Gr011hLGsfUETCs25tOSVFYZ/PiWgErleqke4gcKzExCLCOyDG4Tdz/3dQ
	chGnVq+/y9P2Fy4o+4Sd3u3XP2GecShWQDH/L3w4FGKWgvJ68Vh6J/32Ks9r1dqDh2Ll0QtnXZ21y
	7d1C7FYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to77v-0000000CdEV-1cd9;
	Fri, 28 Feb 2025 20:38:31 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6mh-0000000CYOw-139U;
	Fri, 28 Feb 2025 20:16:36 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-abf4b376f2fso37979666b.3;
        Fri, 28 Feb 2025 12:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773793; x=1741378593; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVAkTZii1Gy4XRugZsnKaWDIV+1UdUIxS1E1wVQkwnU=;
        b=NCigfeh+KJ48+K3rUZksDUooBDHGDp+t+y9Pen2vk5TzHtZmnWOZd4RIIRlbOYdiua
         TvIP0ny2R98JpUTcawD2uZzjrhftU4Oppifek8V9E1KO8UYKj+oHZjTILqxkCDyelsTV
         rtwQyIr7gD/VAJDTs66JEQKdwYs2PIR6/cYBbo1t/BxF+gZYRFpD1ddthjap0Lh5ZzQa
         zW7QDNNrzv7BbL7pLD3JvijMUfdwfbQg6wbY9jzwXKy8xFeycaq3BJtrCOz1c65Ru/9I
         MzB9gqv5ZQ4MfoAjvX0jwawPpfyC0wZ8IjFDsLMdh4jqUoA8EJV9hm5YPawPzGAbKlev
         xqIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773793; x=1741378593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BVAkTZii1Gy4XRugZsnKaWDIV+1UdUIxS1E1wVQkwnU=;
        b=OloKZ/qMX3f820ZDITn5M/lFLCQlM6FfwFKk9CsCWrBjNJVY28AUoxFyqhbT4ERzYX
         /IwuCV+FzMADUqyL5ouHHVRqeYrJmFdLILVF3eQIXbr8ldhy1+idDbcYDqB6OqryHEHj
         YX+Y0v+ufsnpbqkcLS7ZUuLQCVxIhQiQF89jjalXcNv/HOf2+YVXtkmXKmM4WzVQXXjj
         +mr60eh0pGX6T8S77BJvcKjvYE3ixOmcaAhEf61GkP/mu3ZTRNzEkww2lWKVQG4n9X/3
         jn6P0JdZ1BVXO4qZCrcVixVlpW0RVouUlE8+Ax8oNKluYXgQ9v6Q8OfpG9Rklq0BzS49
         UgBg==
X-Forwarded-Encrypted: i=1; AJvYcCWC+6Gjg8ohENIyecrl1IaSLvjG7XtGHmWPrSZytR5z7eNK5r+7a3oCMyXEmZwME008Qf5R83Wi9oefz5Sciwws@lists.infradead.org, AJvYcCXYmjUqUar4g384RgmR6bCA68IN5BkBIZkmfKuIhy32/FQBtmKgsUMMkizE68FOdXUINpHgJwT5RFCMabt0Lj4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNZ2RcjC1NuGa2LM495RYbx1ApLcHlq4fCW0/kpdSGb8wnMAxf
	IUKK8vgIfpyYZv5wqk5X2XajIGTZ/ibi1TblJOjRh41sXFRc2ROL
X-Gm-Gg: ASbGncslL62Qc9sMchg6+28BLpAgtTPS0/rsbNFLgv37DXB4m9RE3nbqkxEInEyUvPU
	JkNlu07FxAbLn/I+1AAuZr/FbtfFcp6cEZPO0sQCQRVJTMjjI0noBlX/9mjFWJ1bhCN4HMK3BAR
	JHXFrSOKLx9KE3VqVuefS38G96RnT9vvKHx0oU/zpxPNFEXzplDNn4nGMYz973e8GAKdtQpxt71
	tzTDgMbzX28Ozftu/8o9TxZ4gt6N2k39hSqJCBbgysSzEG0f+xO9BV+mM9aMoINvFxn4flRfHOA
	IUEJMp85O4dpAeXVXEJX0v62P6T6iQb5fRnKFBmS/7puKopvo54JzA2IsUUcEbHOkfpoJtiFrDW
	HARq5o66VAKCz9MNxeeyMn/hRlhUjEsnZteGn99t908d9TgvHJE4cJPudecHFMQ==
X-Google-Smtp-Source: AGHT+IHTNHcim7XN7hH9c7Sh5FIEX168d0fQlddgi57248KaGuR3JKO3W8QVJ0D+qGDqKD6MfYoZMQ==
X-Received: by 2002:a17:907:6d04:b0:abc:29e3:f453 with SMTP id a640c23a62f3a-abf261f2fd0mr480274566b.33.1740773793400;
        Fri, 28 Feb 2025 12:16:33 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755c66sm340812666b.136.2025.02.28.12.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:16:32 -0800 (PST)
From: Eric Woudstra <ericwouds@gmail.com>
To: Michal Ostrowski <mostrows@earthlink.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
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
Subject: [PATCH v8 net-next 12/15] netfilter: nft_flow_offload: No ingress_vlan forward info for dsa user port
Date: Fri, 28 Feb 2025 21:15:30 +0100
Message-ID: <20250228201533.23836-13-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250228201533.23836-1-ericwouds@gmail.com>
References: <20250228201533.23836-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_121635_287335_0F05DF69 
X-CRM114-Status: GOOD (  11.32  )
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

The bitfield info->ingress_vlans and corresponding vlan encap are used for
a switchdev user port. However, they should not be set for a dsa user port.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index b9e6d9e6df66..c95fad495460 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -116,6 +116,11 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				break;
 			if (path->type == DEV_PATH_DSA) {
 				i = stack->num_paths;
+				if (!info->num_encaps ||
+				    !(info->ingress_vlans & BIT(info->num_encaps - 1)))
+					break;
+				info->num_encaps--;
+				info->ingress_vlans &= ~BIT(info->num_encaps - 1);
 				break;
 			}
 			if (path->type == DEV_PATH_MTK_WDMA) {
-- 
2.47.1


