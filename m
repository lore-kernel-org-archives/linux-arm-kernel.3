Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD67BD7237C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 22:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VQp1vg/dwnKFw/zJMPorPtvt9hOFL1J7rm5VUN3ow1Y=; b=kAITsn/LdlCYpsWtbwePv3AqDT
	OVgnQbOprT1UgeTrYMtpudhiSm2232K0ZLaediEqV8aWvbtE+R3Fc/2sMooHJ6gV/XA35S42xDwiI
	UMbqjNSHqqQ1cpjadMlvKCUCYbbWCrGWZ+Jeld5taWCqMVEtr/h2v9OLP7hHy1tW5SNyiIYDDD2iD
	SwqgL0dV0F3x6abcHYP76lOy0hV3WuVxWjj0JbUE36iwXcH19EnQvZehvduiVu2bsBO+CiITFZKnY
	dLApxDTMchk0rDp016bvjTqK9mpOkqilijFAimCEkq5BnOvoWRCyj5J0W4qTzQRvGgaaE4lDGuBeZ
	s4DgzNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8HQ-0000000BYJw-3cLy;
	Sun, 25 Jan 2026 22:08:24 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk8HN-0000000BYIo-3w9a
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 22:08:23 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-823075fed75so2026608b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 14:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769378900; x=1769983700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VQp1vg/dwnKFw/zJMPorPtvt9hOFL1J7rm5VUN3ow1Y=;
        b=i8LzdEmSbn2Ipo5eEvhiEPNUWmT06G5oGfd3QUZDixW/ZeUKm+CJwrkhEfkQlKMo5G
         kwKNTYqcUEFIQVdsl/S4PlD93+Bo1HUtuzaNT3hkI944M79Tpc67TxfNoBF+O8GNTHR4
         +hFTdg/Grr/xazYTJzC1gUKsSR8qBFtGuyqjCE8x9bpYgQ+JrbjwWxLOSzwQYxXnok8E
         VG+whpQwCq2vXg0gBLdgwT7JeJYEXbtaaXOoR3zDgT1H0JEoAMXk8t928bvipv00+bxK
         g9tll3mTQDBF023k/nLVtPm6O8B1z14k5F7h2jr/gm/HfRSRt2FkdttsgiUAsn5MOya4
         CBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769378900; x=1769983700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQp1vg/dwnKFw/zJMPorPtvt9hOFL1J7rm5VUN3ow1Y=;
        b=lRAC/WbhhzvQ9ptv2lLcW82vJbC6MQh3e08nTMykYdQ5ZSsMBiF91qcJwGTnXekMEz
         j9L1ssjftMKFAORzWGf6Am0/MGFVfxM+tIkPT/gQK/5yP+uPOEb2VN0EjHzDFJC+Gd9w
         H3G139rCESXPKn5qpsd4Mki2p0o6fT+2AylmX+f0aHt+oLmY5pWB4dc+pov/cGSLLk+9
         GJ+yo7Ed4RlA6WVLSCyl6DUBNYyGIGrgWvkBZmX4XZdgwdWMpBECdbz8D3lVMG1HW7YK
         +ifgTSpujOGfiCca7YMwti46XAIHEP1S/kg8V9ZxOJobYgVUQjcogl8LHkuUV6jiA/li
         uwJg==
X-Forwarded-Encrypted: i=1; AJvYcCV5kIYWJdWxq8Gs/GZid4uS2I2GjECFW+zgqeQiZOhGC2Q/grFuwxr0p/T1oILjj17BPBVgqgFK6542UhJVjDT8@lists.infradead.org
X-Gm-Message-State: AOJu0YzPHnPE+uACfLB7/1A16xz5MU/B0FQWRBTpiQW6mk08JzDvZi8V
	s/SOmGEdLrx+HpuQiZL5P9iWPRywRnsUuTn1X8JZ4r5c8WyQ1QXWs77q
X-Gm-Gg: AZuq6aJXkFsgGgxnhA75End1WG3MiFbv7ljAifFZSRoQ64qNUiotI/NB3BxO3sGq0EJ
	8N88y3DzXCNOaeWOvPsmiqhHmDSgSl7P6ZKmvnUcByh2PM6Tq6bHspOa2xaCS5EfrgQAsfZ8J+x
	lwwpX3W9cRW7NsdLc7JAQXo0htvMktRB+xioqNu3kbVmxhfNxeTbs7p7roSt/2Mb/LnMLaTwpCG
	ctv1BjR8u0WWnsAEoUgvyN9LHmbWVoZb5OJpLVeWekcT5DFPXh7iEaAnFB9hdfdLtFRNIigHQMw
	jIHxcZfrhKrKNvZt0SUia3vXzF7rOeVW9UbXIkt0LfHK+0H/eJ3utRzQMBLvwMug+SeXLydTcBi
	CNFRWyJPJVIVQRBUE2sgVjqlqff+nmEd+EAoM4UrhtUIbsFCIx3vg4DZj4nUJghacml8xN7Tf5r
	qXhTZhL52tcpt80Bg1c8a3CwFy6PvBp8CpW7fmG6p6/kGi8xN8VoUAHGn/+dco
X-Received: by 2002:a05:6a00:2e10:b0:7f0:61d:d092 with SMTP id d2e1a72fcca58-82341275fa8mr2266896b3a.21.1769378900326;
        Sun, 25 Jan 2026 14:08:20 -0800 (PST)
Received: from d.home.mmyangfl.tk ([45.32.227.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231873e60fsm7651286b3a.48.2026.01.25.14.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 14:08:19 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: airoha: Use u64_stats_t with u64_stats_sync properly
Date: Mon, 26 Jan 2026 06:07:48 +0800
Message-ID: <20260125220753.3984326-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_140821_979731_CF3C13E7 
X-CRM114-Status: UNSURE (   7.52  )
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

v1: https://lore.kernel.org/r/20260122185255.2761568-1-mmyangfl@gmail.com
  - fix u64_stats_add()

David Yang (2):
  u64_stats: Allow u64_stats_add() to accept s64
  net: airoha: Use u64_stats_t with u64_stats_sync properly

 drivers/net/ethernet/airoha/airoha_eth.c | 153 +++++++++++++----------
 drivers/net/ethernet/airoha/airoha_eth.h |  34 ++---
 include/linux/u64_stats_sync.h           |   4 +-
 3 files changed, 104 insertions(+), 87 deletions(-)

-- 
2.51.0


