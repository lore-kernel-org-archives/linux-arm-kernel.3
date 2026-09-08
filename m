Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F195C79F99
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 05:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSn4eHKtRzspZgNVVCdMYZdE8RSN993BlWf0kOF29tw=; b=O2TpYgyOSQjbfKlU4SXq2cA1DA
	9AcIL8gKxp05zRQ8pKj8XbC/bZ1dBY4E2yk+lw2GbO9B6CFBigQTsang+VABkb1kKQMveeU7ID56n
	dIMpDOAEfU3wyz+fhuFS7NPBvLKm+YZOF4Q+/rewfpOXCwKxMpMy7i4XEehXHkBDodmO/Bk7U+5rk
	6oiBq2es6Js3rfO3eOUJv4UGghWtrumzK8RY2+sDADDZUP2IJv+2ysN81aag7dqOvhG/RGH35lyK8
	nsxo7ClyqpHRHAbS5oy5RbGSR1uMIT5Re2JpDWA53xxL4SoDQ1+vO+T/NH6jAMK08vOklIJJYRZjb
	CcNze/xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oLh-000000083aM-2Vs0;
	Tue, 08 Sep 2026 05:26:25 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3oLe-000000083Zr-3xai
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 05:26:24 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso3351711a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 22:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788845182; x=1789449982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tSn4eHKtRzspZgNVVCdMYZdE8RSN993BlWf0kOF29tw=;
        b=Hgk5UUalyDtFpS1spB5pEFflVnshSstYU/KJDWuVJrcDog0y3Y5OlyFibnwt4T8s2v
         WhmNQ4An/GI8KPqG8kwV+CnyPlMubAc7dFlpGHPeTl3Z7hICGxQLQbv//oDXYeu96ig0
         CwX0Bdjw+RvXtTE3qKMq5T7F54whBzqVjySVQ4aegGqabAlxRkv+UtvTiYir8tp7t2fF
         0t8MMtcg4avJ3lW9jhh+5HhalfrEkhNFP1xNOE3E0uGIaBW0W2VzPxC3ap8/LmNdIRh3
         ZRAj9Fo/9ghEo3Jagdxn8SFwIB01RbLL3DFX1JV/NYFg9HefYrPiKFYjvejvfif75AZX
         rRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788845182; x=1789449982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tSn4eHKtRzspZgNVVCdMYZdE8RSN993BlWf0kOF29tw=;
        b=B9J9JkYg+MmDfXoUn0m6UwdRx37PTtztLENUtDkFAidBGLDxPRVlToF2fnopoygMrk
         Zn7Trdk7hbdkULsVAcTuIn+qf0nBnsOOk1Sitzs7+czzcT0uVaJn8YCesPOp7hJZnnDu
         6gjxJIDzW7DxaErNJ1oGGvPVohmlJXK4OU8iL7ttsGOktUtAEVyx1KuchQnAv2xYeSoq
         LA8Iedguf+e3XuBqX61e1i2maQUaDvQ28Ty7+2nhJO9KvABdH6D6gS3Guvxgyoot589+
         oXz23gQLXliKYICLWlt+Fbz4Qh4iIhLv0++uZD5GL7PfbII0uv2Wy8IJphTf+ITm38TH
         u6Xw==
X-Gm-Message-State: AFuF++nCSvxvrFcqpc4y2PZ1i+xhGRXvbzcqpYJCQVxwkDJ6z+GHGHqx
	5Zm5PwhAdC/UW3VpXrd7Ep347ezzLuC07Ju5fYMaKhDgsYrCQxH6FJZQ
X-Gm-Gg: AYBFou0o7Z47PJUvT0qe79Q8qxxhMo9Y84l1EC5rLSw8oNxNxqpXTiVDOCiROhEsYNa
	XV+rSCFtyyBKdRwEkNyVxWyj+YIFtXRbIglc9r9wOp5ATVc+0yYzn1QWoekMu/cfub3WQsrC1fn
	4dbmzkL2WDWtp7IJjQI6jd2fk1zN6lPA2t41eD7b7jnZapqpN8/1cZvto62L0Lt7iAJT+gM3GEB
	Uwsc5dRtbJtWXJJjb4teCLjLPwtWcgbKVPsaVafpGvjOz4q18tqYLINoPh4v1g7NmWrKU9wOAJK
	TeLp7Fsl4QhpgMCjtekPcC1ARKxp0A6iWW3udDgQETdMLWNu+onHCF6U/dZrJzxcXeRxp71mWRI
	L0ERS6rh22N4AitBCfQ+1E9pNSndXtlmA5SvHQ/IZpyx5a1cHa8EB83ivnFUVgQaoI7uhs2sMch
	LpbSGLVPXyM3IkS8ehAVQcTEEj3E+lP196TlJcOdj3UzVBG146tdL3pNSHAWNqgDKQT0HmRxcW3
	kvil5tbE9qukJP+QgBCk21J
X-Received: by 2002:a17:90b:2542:b0:398:9beb:a2be with SMTP id 98e67ed59e1d1-39b08969b5dmr36864640a91.32.1788845181942;
        Mon, 07 Sep 2026 22:26:21 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm11720586c88.9.2026.09.07.22.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 22:26:21 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Chris Snook <chris.snook@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Geetha sowjanya <gakula@marvell.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Manish Chopra <manishc@marvell.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Rahul Verma <rahulv@marvell.com>,
	Ratheesh Kannoth <rkannoth@marvell.com>,
	Russell King <linux@armlinux.org.uk>,
	Shahed Shaikh <shshaikh@marvell.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	Sunil Goutham <sgoutham@marvell.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v3 01/10] net: llc: fix repeated word 'all' in comment
Date: Tue,  8 Sep 2026 10:55:53 +0530
Message-ID: <20260908052602.27497-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_222622_989352_7152FF5C 
X-CRM114-Status: GOOD (  12.43  )
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

Drop the second 'all', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 net/llc/llc_conn.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/llc/llc_conn.c b/net/llc/llc_conn.c
index 260460d50f54..4b6fe9a473cb 100644
--- a/net/llc/llc_conn.c
+++ b/net/llc/llc_conn.c
@@ -193,7 +193,7 @@ void llc_conn_rtn_pdu(struct sock *sk, struct sk_buff *skb)
 }
 
 /**
- *	llc_conn_resend_i_pdu_as_cmd - resend all all unacknowledged I PDUs
+ *	llc_conn_resend_i_pdu_as_cmd - resend all unacknowledged I PDUs
  *	@sk: active connection
  *	@nr: NR
  *	@first_p_bit: p_bit value of first pdu
-- 
2.48.1


