Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FA5C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 06:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NG+h0fEWkShkE2dq/JvgIwncxcSUVIaRrf1Kfa8GBLU=; b=xsciG8cmFn5dVQEjwGpgnSrXd4
	TlqDpMDWMYHbfoP7G9ufvj1I1QXRBUA5lOqyBj8lvcsuBV+BrBjhxOffDfPp55HV8JrGDCEa/fNEr
	+KB+hihdr71BGmjqYT4/ayhI/ZMAKA+LFq1lBN2EUSiA9y6ivu4joFbvecItm2dkSMU4d3Ty6In8H
	5/skuqUvkVBO2SbNkVPC3wcsWf9GVr7gw2zbcFL0rghRuoWmc8gF9OmWwwM+U8J5inn8PPFApZHQn
	CmNl1DSc7YVKAKWGWs3mBKpoAFWEgzFaBfl/DmpjmKX2/hXKPfQjwSb5RXttJkK2jWlf1YGJFDrIP
	yyRDeZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x35yD-00000004jXe-2U6O;
	Sun, 06 Sep 2026 06:03:13 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x35yA-00000004jX1-2s2N
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 06:03:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-495437bb891so15519355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 23:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788674588; x=1789279388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NG+h0fEWkShkE2dq/JvgIwncxcSUVIaRrf1Kfa8GBLU=;
        b=HXSu1aDydnVyUeD+kHdcItbYz2WDrL6Xd7s72aAAidD0SMWYYI0c2M6mogEXraUGB+
         fWFTCV7bBJkoOt5R0nvCmVgDlUoIoSbSe+cUId9h5JYAKZ4Vv44AhDTwlvlswhjxK4XB
         IGGhGzZb+DGGlwej9wFWa5bM+1tmYZ2njOuTuuHp5vbZTiNQ71JzNCuHapYGFTSnNZ6v
         pUN9NK5PHPgrbowJGk7N4zdReYSv0qlJq67Aez50bQP6pyIbdVPyeT/rqCmTWniu+Ro8
         9GYF2WyyLB7e+PnWXiix0nNHcdrgh3ZvANiD41/pVnmsLsURY9tUmbk4PP1c93489YNE
         CUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788674588; x=1789279388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NG+h0fEWkShkE2dq/JvgIwncxcSUVIaRrf1Kfa8GBLU=;
        b=F1yz5n727aa9CXGy12PurUoxhKcz4VDfuna9FdEzB5NtyOFJuBfDvJMGn+S/q2e3jv
         oiy1A+dC31HZBnivqJtXvNQRudAuLhkamM83C88pIA29BVQedvPVhjiddeLthaMIB4eA
         uZFDgbWiqSjZlv/ggDXLSejDSV+8EMTYoJDehvjAF6CEkGBT9/WIFdk3aS3VCnIh20tN
         TdIKYJ8Hc3l7owWMNw/iyae/OfVRDW+VlQtZvffLy7PjoOQWacihJpft9vEoJtJ5zNK1
         GvADX3yxI8LOd9i9Ff9W6wH21DIyxgBN5EAzCTo558aV36jc2gi3N4LzWXBA+UsvwZbA
         uX5w==
X-Forwarded-Encrypted: i=1; AKwUvByeT8Mj3AC8nA3Nzl8jTr6LiU/XMpRh6pJW8D96lFI4ilTFJaY4QXXy7SjmJgM/qnhRRB+uD/X5fIE8hj9zlOxO@lists.infradead.org
X-Gm-Message-State: AFuF++lTV/Vpj2uNor+8nRwsPD6on4xAemNkocjWNW2CN1B0bievA9DI
	RCi7WKnnLQpoYvllU6p2eWOoPU3qfC6kgVyfd0h38jhGZ42N/mHWtaQ=
X-Gm-Gg: AYBFou2YQq7rnRaKItRjD2QJrIiVIweSio1rEU2X2+mNc4YqO5evzBmfwGyfvXYANHE
	RVmLsba0zHvB6cWxqlE8aJRRz9EMjq9/BRs77pz2Ej7g/ZkxW5o5lDXbg+LhNERJU8vszXlAXss
	BCz5j7Jg1w+jmYKt2ucxZ/GUPVvmhOTVo4oOZFOzDPHR1bdSY2xsqLmUnuMQH+nxrEjaX0kFp/n
	ZSBP1E8bt1bVySLermQ+gd4MjY87i3XyJ8SQhBCQ5jgeTChjedxXgVu+xnfSwx6YEbxfW17FaZM
	K+TRmHvaZRluhhkqRlOWPshn2MCADjq8/2bSfm+cIdPzrtbriWDLbGGSoFzmCPDBWM2oRq3+tOt
	OppLKa1yoKFw+dAVth/Tw/3/NOwkChySEVctlFoiWqAFBbh6GKc0Ie+kp0svzFCe8S3ufp3YtmS
	J9Jt86d+p4CP/QwkWLhx4P+v5wMpxxhMeJycaauSUuTiOP7FICEYk=
X-Received: by 2002:a05:600c:1d07:b0:49c:f13e:e4d with SMTP id 5b1f17b1804b1-49cf86f4fe4mr138838165e9.10.1788674588092;
        Sat, 05 Sep 2026 23:03:08 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm298147805e9.4.2026.09.05.23.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:03:07 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: Re: net: airoha: RX rings below 32 descriptors let hw DMA past the ring
Date: Sun,  6 Sep 2026 09:02:49 +0100
Message-ID: <20260906080249.944732-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906063750.719445-1-sochnev.v.74@gmail.com>
References: <cover.1788286284.git.sochnev.v.74@gmail.com> <20260906063750.719445-1-sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_230310_744468_D9A7DA58 
X-CRM114-Status: GOOD (  10.60  )
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

Correction to the platform description, and a stronger dump.

I wrote that the images "differ only in RX_DSCP_NUM(); no other patches".
That was about the difference between my own images and is misleading as a
description of the driver. The tree is OpenWrt's, and it carries an
out-of-tree HW GRO patch that touches exactly the ring under test:

  AIROHA_RXQ_LRO_EN_MASK = GENMASK(7, 0)   -> rings 0-7, including ring 4

For an LRO ring that patch sets buf_size to 16 KiB instead of PAGE_SIZE/2
and clears RX_RING_SG_EN_MASK, which mainline always sets. Both are
plausibly relevant to a DMA overrun, so the result needed rechecking with
that removed.

To be precise about the base: it is 6.18.44 with the airoha RX path
backported from mainline, including 269389ba5398 ("Set REG_RX_CPU_IDX()
once in airoha_qdma_fill_rx_queue()") and bbfb1983944f ("Reserve RX
headroom to avoid skb reallocation"), both in net today. The GRO patch is
the only out-of-tree piece touching this path.

Rechecked with its LRO mask zeroed, which restores page order 0,
buf_size = PAGE_SIZE/2 and RX_RING_SG_EN - confirmed on the board by the
posted buffer length dropping from 0x3E80 to 0x680. Everything
reproduces:

  ring   LRO   panics                        overrun signature
  16     on    3 (one with no load at all)   present, 560 words
  16     off   2 (one with no load at all)   present, see below
  32     on    none                          0 of 768
  32     off   none, 268 018 frames          0 of 768
  128    on    none                          0 of 1024
  128    off   none, 273 921 frames          0 of 1024

The clean dump, ring 4 = 16, LRO off, taken while the ring was stalled.
Descriptor 16 does not exist in a 16-entry ring:

  desc 15 (last real)      desc 16 (past the end)
  +4  ctrl 0x80000156      +4  ctrl 0xC0000000   DONE|DROP, len 0
      DONE, len 342        +8  addr 0x00000000   no buffer posted
  +20 msg1 0x2A5E0000      +16 msg0 0x00008000
                           +20 msg1 0x2A5E0000
                           +24 msg2 0x007F000E
                           +28 msg3 0x0000FFFF

msg0-msg3 are bit-identical to the dump taken with LRO on, so it is the
same engine either way. addr = 0 explains DROP: hw ran past the posted
descriptors, found no buffer in the next slot - a slot that is not part of
the ring - and marked the completion dropped, but wrote the structure
anyway.

The panic in the ring 4 = 16, LRO off run landed in yet another place:

  nf_conntrack_hash_check_insert+0x480 [nf_conntrack]
  nf_conntrack_in / nf_hook_slow / __ip_local_out / udp_send_skb
  Comm: ntpd

Five panics so far, in four distinct places, none of them networking:
cpufreq's deferred work (__queue_work), the scheduler's load balancer
(sched_balance_rq), the scheduler's stack-end check (twice), and
conntrack's hash insert.

Nothing else in the original mail changes.

