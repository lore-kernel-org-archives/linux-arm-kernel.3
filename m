Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1010C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 20:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNvAyhAv6GepxNEYkCskllQBVi38mrCeZ4SsbbR7WSY=; b=z/qNdRgR342bsfnPwou2sIc3ef
	J8OBg5bUyjPcsliD7bjS5cdXk3ZL06tgW9hUJwgBAl+d/j1gN2wlH+nJudhAricff32LDn8ZLUrk6
	CZinCqxBJxrcN6KHmts4j4RrN0pUK/QoX5YBD9hZLc9ZWYX2V90RpHJQ0gFpT3a4dbv5acG/uRHpQ
	5aFBVsJH37IXOitJgzhEOyyWtq26vNTkSRxcR2LrleizjI9X0/oGbQG3V3FV1lsV09XxA10yMVtAP
	7RSMDnUOIjoo8AYXZt4jm4TlCEHyD8gurwN5jIbBZVd/wz4fAmKDg1wmX2Qq/+0uxA5T4KZT1PXSF
	yCgz69yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn214-00000001SDD-49yT;
	Tue, 25 Feb 2025 20:58:58 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn1M6-00000001Kgu-2fQY;
	Tue, 25 Feb 2025 20:16:39 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-abb7f539c35so1171749866b.1;
        Tue, 25 Feb 2025 12:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740514597; x=1741119397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNvAyhAv6GepxNEYkCskllQBVi38mrCeZ4SsbbR7WSY=;
        b=HCwZnWbjKXIEBVCr6Js9OsKir2vh5VBFOPz6o7A0lLhkkIyLNRq3aCZh2qgOSPuH3O
         0QWUgPlmsLM8VoBFZVHy/3EbR0Lm1itIl2XTZ3RA727F6Wg2YlqCe/+i0f7zxW3Uzubw
         KVtOOEsZOLatR1fx+U8e7wll1nURnaC+hjctTN9NOmsxv1CWNI6fnyIrMGm+iCNl8+p9
         4gazjnc4KkUXskOr30ruzvSLZcENY0/E2aK6GyoXtFydUW07j3uir3di20k4l2ce/klR
         JVHOQNbQPAdZOafJPDt+IvzoRYYTkvi7yjI2rqnHd6dgPv8lhsnStisobDOx9k76i6w6
         Y6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740514597; x=1741119397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNvAyhAv6GepxNEYkCskllQBVi38mrCeZ4SsbbR7WSY=;
        b=ZqfFJ+zW14YsJv8UYvTWciQHRtaTznJMbUSfzQwsrOkabDTAjglA+4pVoA4hFFGoZp
         FNZFPdj2k2NF2hq0UoKIhqiJNAegzGZvCcpNXFVy6RbEyXTzBkPcX8NBnk7r2/6RY4Tv
         8CPCOy9QxM4YoGndAVJpZurrAmZ3e7xZ8aAABf5A4ojAFebg4fguPXO14JSK02S089+O
         cylkcoFz6tJT7nU5cwzJs9FSPuFO2OcB5At5bZyfkwKc+IH+ZYcjr5aWT+u8Ht52axKp
         nJHnsGbYbbaXBMO4MgbgVeP7XxtbqZG/98RWZJVgwyaZmvpYi6YZBs+lLvpCaDLWk+JB
         yU7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUr6XPGEw7rRcmc9nHgA2vl5hvutSlRTyMycPqo2M6eqcS6Sx89RUdzSMpyyatmhQWKo9NSdL3CxUbYuC84BNw=@lists.infradead.org, AJvYcCWwPd9wlZECIfuZEiplLmnTzCnmTFKCl6Z6w4KMGE4CADC+x8bF52Oje7Ujn/T3BUfSbLXCQqsDubK/kv7AmNdG@lists.infradead.org
X-Gm-Message-State: AOJu0Yys+O0pA1FwXbEXKaQC3D2py20ZZzgWLUe+V7TYCYlgpAOHIrKE
	c1IopPlRi3ks2pGmte+Fgk91EkYaJeZygt7amRrZwhycrPHvxCBQ
X-Gm-Gg: ASbGncvgqLebDrhZ7AQ5nL8A/vsGdizBOupx/DpH+K2/Uvq3Bxwmw/jWoqR3CQO3M/6
	T8UwTjz/WvT9tjKidJkg4mJxuy2RZJIhZxnVQ1IMSdDHmasL+n1DtzZd7clqrm5skeow6BKcYa9
	s/1I2hKJPFWFUcbT0EBiBwjJnCsHRw0YSzyeJ4zS+iXTic+63U6gCPux/VB6oBz12K211er5Nqi
	6W5Bs4rEZBbSDkPPn+Ob6vm9+hJ6WKTiE9P6L8cHEG3gBqKDP6TNWKu1gFvX7zI3IbiVphuYFlA
	w3NB0Y/s9K2ZmN4rIFnY+hFStv+RL9S8tms9k6QXG+vxQhBxG2Wb8bOsw1UPkm+9waK87goYs8O
	0Z4KFgl4bwiQ23A/pQEJ+RUUmN1Q9pligEPDPxGZGMrI=
X-Google-Smtp-Source: AGHT+IGxUdijvIUHSsavOxjOEGtqnGWOKkNqobQSxe06Fq+xOGdhhx0QApPI1c+j5z6WHzO8JVwaLA==
X-Received: by 2002:a17:907:1ca4:b0:ab6:d575:9540 with SMTP id a640c23a62f3a-abed1076c86mr522925566b.50.1740514597100;
        Tue, 25 Feb 2025 12:16:37 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed201218fsm194319666b.104.2025.02.25.12.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 12:16:36 -0800 (PST)
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
	Joe Damato <jdamato@fastly.com>,
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
	Eric Woudstra <ericwouds@gmail.com>
Subject: [PATCH v7 net-next 10/14] netfilter: nft_flow_offload: Add DEV_PATH_MTK_WDMA to nft_dev_path_info()
Date: Tue, 25 Feb 2025 21:16:12 +0100
Message-ID: <20250225201616.21114-11-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250225201616.21114-1-ericwouds@gmail.com>
References: <20250225201616.21114-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_121638_689799_890D5ABE 
X-CRM114-Status: GOOD (  12.97  )
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

In case of using mediatek wireless, in nft_dev_fill_forward_path(), the
forward path is filled, ending with mediatek wlan1.

Because DEV_PATH_MTK_WDMA is unknown inside nft_dev_path_info() it returns
with info.indev = NULL. Then nft_dev_forward_path() returns without
setting the direct transmit parameters.

This results in a neighbor transmit, and direct transmit not possible.
But we want to use it for flow between bridged interfaces.

So this patch adds DEV_PATH_MTK_WDMA to nft_dev_path_info() and makes
direct transmission possible.

Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 net/netfilter/nft_flow_offload.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/netfilter/nft_flow_offload.c b/net/netfilter/nft_flow_offload.c
index 323c531c7046..b9e6d9e6df66 100644
--- a/net/netfilter/nft_flow_offload.c
+++ b/net/netfilter/nft_flow_offload.c
@@ -105,6 +105,7 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 		switch (path->type) {
 		case DEV_PATH_ETHERNET:
 		case DEV_PATH_DSA:
+		case DEV_PATH_MTK_WDMA:
 		case DEV_PATH_VLAN:
 		case DEV_PATH_PPPOE:
 			info->indev = path->dev;
@@ -117,6 +118,10 @@ static void nft_dev_path_info(const struct net_device_path_stack *stack,
 				i = stack->num_paths;
 				break;
 			}
+			if (path->type == DEV_PATH_MTK_WDMA) {
+				i = stack->num_paths;
+				break;
+			}
 
 			/* DEV_PATH_VLAN and DEV_PATH_PPPOE */
 			if (info->num_encaps >= NF_FLOW_TABLE_ENCAP_MAX) {
-- 
2.47.1


