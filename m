Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F834C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWSHNbB5JKEbeWuUj8vjDFfUx12Bd6PhpeoYLsDsQTU=; b=KDLNIBcFD2Q2l8CL5FP3KeNdxq
	aSgFSnxTTOEt14Zhj3E9zpG2EUYqX7oyj8zeGZalSS1hwkDpUKvkVUMtM9+TFJjpBE6dHzA2d4pGb
	fezR7atFWgEwjSxj5tzerL+mXlv6QaVun8mlY7+a4/PM+rYXNzseDqbYCIiPKr27/6rXB4LV7suW7
	iWvEW21iGTxUJDr4YQFN5WgRGCrIqzgMstVOSTx/u/lg+z9hHUIxBboavoyVI1OH5EENCf/LW94Ie
	8UZVrIGLG180S4Pll0ykA0VfDe/wAB11Ha4Ztl7BiV3IujmtCp0/dIT5S/dnEtaYSvFF0CGpSZBat
	fR1wlgxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmad-00000007nk7-1pRA;
	Wed, 05 Mar 2025 11:07:03 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm0v-00000007gQy-2Svw;
	Wed, 05 Mar 2025 10:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UWSHNbB5JKEbeWuUj8vjDFfUx12Bd6PhpeoYLsDsQTU=; b=n1ok5mW3h7wYGpzuhX8DhL2cwz
	ll/CSLQMN3igK3OkCWwlUdNgZmmEy39PB6SH4jpwMVmPf1oy4kbjnXtPkJQC7gq+7PiD5QDB49qgS
	JbRHCqJadPfjPrLT66dN5t7IvzPIvZHP9fQPC54Nnw+dyq1D0AD4fu6ipMnaM9BNe5AUTEu1RG7Dt
	ddgl7y0sMPA0FKSGqNdmMyeyNoVPzNdGjvQpae+iktKYVwsX3NRH3j+IfTsQKljc3IvJLLBusCy5M
	0lWxTVI1khsRDwYrNSInmcG2t8CIevT0zDFbGF4qbwrHXsK7MU20t6kPv+OggULQQmBx11PYZBFz8
	cFsT8f3Q==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpm0s-00000005Ioj-2XnU;
	Wed, 05 Mar 2025 10:30:08 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-abf48293ad0so699086666b.0;
        Wed, 05 Mar 2025 02:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741170604; x=1741775404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UWSHNbB5JKEbeWuUj8vjDFfUx12Bd6PhpeoYLsDsQTU=;
        b=GeDRfkXLW9xfh71Pvz13c32s0n1C6141kJb/wGxKLNdMXnkRb4jl+7AIid0I2KO/NQ
         sWC2fyDRLpjPNMFrsfbbA1nK9x3kPxZvEdK54qHXD3lt/KrMl0DbJW2xw0RGr0NgJ8GD
         o+pssmNz35vp/mC6NH8+8d7ACddKzzVvkMrxGo39CSF+Bs/JsMhvnPmcJFokDkjIInJ1
         D6ua/s80tNGP2JLB2TTKcKGBlfso36p/p5w3iqm4YdP8qsJuurjpzx5bR9yV35ANVP1V
         ohzrYosj9uLfyTofchu5gnlPxK8g8Icb3N1z1UYYwAeaTAawwkNHmvjwksdOkOqdLZbS
         D+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741170604; x=1741775404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWSHNbB5JKEbeWuUj8vjDFfUx12Bd6PhpeoYLsDsQTU=;
        b=MQwnzQtwBGIhzgUZ88n9zv6BJs9Tpm0GR8WsNrERTOh7N3xQCLw5M++2MwMBgAlLZ4
         QcO106cdsOXefDsf/WRJr66fVcSUXVQwW/AKDhaj+5mAue121+sRrRYxFKqehTh5fGgk
         cNepgAagd4+8u4fnUivfOLquslrhaznLmA4qYm1eEDFZtJSBWUJ6yZaKZMp9Bj2dFS+d
         ACwv1LZ3EL3nS+yg3moPWirhjzwPv+6w5J0XqDbHvVXwqJN3VrACaQu8QiObqXRHpRy8
         cuwVWcGTIr1b8l/RXhAi4iGaqmyvQo1CjtKfH9ZRtXuyYeSbXQAWDJkqRPNVQ4GcxFxp
         M9Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUIJH+t9RZRv69sxM354ae+Wjlyr6gipTQK7+uy+ZCp8RlMwutnJd2GaZqbYs/yewatr7RM3jqce+n8oqgrFMdA@lists.infradead.org, AJvYcCW7Ye2sE+P97iBsERi061OyXPEHGup2Ar8ItTxbiuGAqqz18Po9Rc47tniOMaPReScMbxrBfHjLx0bEYeXm/ak=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCf3Nl5a5ZRrRw/JNcdTN1tj9yYzk3B8BP5+pzXgmuwBSgps8g
	5NdsrQ6I6i/SLalRtmQvxDEri/SBNI3IE2jIhJ8fz9Iu6vGCQemu
X-Gm-Gg: ASbGncvToIOkWeI6RvXtGXN7MtIbl9m2iaqcJUYQel9UP1DMU7savmNdbxIVMCvV4OG
	FIaNQWegfaBy5Zvu6xANlI0k4YbTZ1N8GGdFim0ToExWNohjJNKm+E6NXj1bejgn/p6gUmQ0Txx
	SC28ckbYdmpywhI9xsZmIqKDiK3qPpXAljf+6eZJV0wEaxLKfoFy4f2b/O3q9stiLqzPtCGpyEQ
	SFzYeM0jHEyroLrkwsQCzEd7hjTbNBTVoGqqUZh1YR6EAoAAjqPlW+WdTuHFU4qG5shnqn4C8TJ
	7/sZC348Nt+JxqObMoKYiVLihMcUBD5T8dhLrVgc5Y44dQTlnBw0/or8ohy+FneEuttT9y+2gFy
	++JprraQGsqQp8pz/MfgKSj6TTsSIjZ7mprr3xn4iXN+VTH2Un0awZPp7I2fhGw==
X-Google-Smtp-Source: AGHT+IFmOl+znPOCyIBVoWXbUGUsHEWWessyONqSdjDiGli0zSAoB+kKDiPnSaw44bEm0nFmaT3VhQ==
X-Received: by 2002:a17:907:3f0a:b0:ac1:ddaa:2c03 with SMTP id a640c23a62f3a-ac20d036458mr300465466b.0.1741170603887;
        Wed, 05 Mar 2025 02:30:03 -0800 (PST)
Received: from corebook.localdomain (2001-1c00-020d-1300-1b1c-4449-176a-89ea.cable.dynamic.v6.ziggo.nl. [2001:1c00:20d:1300:1b1c:4449:176a:89ea])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac1f7161a4esm247154266b.161.2025.03.05.02.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 02:30:03 -0800 (PST)
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
Subject: [PATCH v9 nf 01/15] net: pppoe: avoid zero-length arrays in struct pppoe_hdr
Date: Wed,  5 Mar 2025 11:29:35 +0100
Message-ID: <20250305102949.16370-2-ericwouds@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305102949.16370-1-ericwouds@gmail.com>
References: <20250305102949.16370-1-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_103006_920286_2342849E 
X-CRM114-Status: GOOD (  12.86  )
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

Jakub Kicinski suggested following patch:

W=1 C=1 GCC build gives us:

net/bridge/netfilter/nf_conntrack_bridge.c: note: in included file (through
../include/linux/if_pppox.h, ../include/uapi/linux/netfilter_bridge.h,
../include/linux/netfilter_bridge.h): include/uapi/linux/if_pppox.h:
153:29: warning: array of flexible structures

It doesn't like that hdr has a zero-length array which overlaps proto.
The kernel code doesn't currently need those arrays.

PPPoE connection is functional after applying this patch.

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>
Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
---
 drivers/net/ppp/pppoe.c       | 2 +-
 include/uapi/linux/if_pppox.h | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ppp/pppoe.c b/drivers/net/ppp/pppoe.c
index 68e631718ab0..17946af6a8cf 100644
--- a/drivers/net/ppp/pppoe.c
+++ b/drivers/net/ppp/pppoe.c
@@ -882,7 +882,7 @@ static int pppoe_sendmsg(struct socket *sock, struct msghdr *m,
 	skb->protocol = cpu_to_be16(ETH_P_PPP_SES);
 
 	ph = skb_put(skb, total_len + sizeof(struct pppoe_hdr));
-	start = (char *)&ph->tag[0];
+	start = (char *)ph + sizeof(*ph);
 
 	error = memcpy_from_msg(start, m, total_len);
 	if (error < 0) {
diff --git a/include/uapi/linux/if_pppox.h b/include/uapi/linux/if_pppox.h
index 9abd80dcc46f..29b804aa7474 100644
--- a/include/uapi/linux/if_pppox.h
+++ b/include/uapi/linux/if_pppox.h
@@ -122,7 +122,9 @@ struct sockaddr_pppol2tpv3in6 {
 struct pppoe_tag {
 	__be16 tag_type;
 	__be16 tag_len;
+#ifndef __KERNEL__
 	char tag_data[];
+#endif
 } __attribute__ ((packed));
 
 /* Tag identifiers */
@@ -150,7 +152,9 @@ struct pppoe_hdr {
 	__u8 code;
 	__be16 sid;
 	__be16 length;
+#ifndef __KERNEL__
 	struct pppoe_tag tag[];
+#endif
 } __packed;
 
 /* Length of entire PPPoE + PPP header */
-- 
2.47.1


