Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85595CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 19:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BPFeHG3eQWm7h273qNIPgzRDB2uND5oH+mVxaZVS8FQ=; b=cSaTMP6HOCONeOZ0HOP8MLw2pd
	2NGeG6De5Xk73K4cSflRV4j29SQaN8AZ12IXIdCsKXh/4bu7I8Qnwqs6Kmr1c7QLjGyvaSmFrldGc
	Uy/dcTUjqz8czZtFqn5tkM6hibq9/eW4N72yddaf9RP0tQi6K6q4dhHQnpUDwDgp0i4xYCnL0hIys
	wOBXpPXinL7h+PMEbn8JDrUjjU0tDS9LydnlGJGJ50yb2S3GAsnub5Xbsah1nDqM+sy61fIHYDZpS
	VYIRbqcReX/xBSdXDPGJppiLkhVEEONNtVI26E5nmH3hJC3QtLxaoZovUNYHSt5UwiUuSUr1FTpXw
	4S6qaxiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKiOz-00000001vd7-42aa;
	Wed, 06 May 2026 19:59:25 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKiOy-00000001vce-1A31
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 19:59:24 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-364f65f6eaeso99640a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 12:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778097563; x=1778702363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPFeHG3eQWm7h273qNIPgzRDB2uND5oH+mVxaZVS8FQ=;
        b=hG0dK26ty9qzproARhTd9kipETyep2Af6TmK3LjotOWX1mtLuUefCOHMVS0K3VNlLO
         UZN2TedA753Ge1AyyIDZtSS1xaP4iYsgTzonK/s5++krCkAWwTIEf/JiFGKQP2kwVdQw
         +6rCxQsxbjk19DF31JNEM3sjrWBDV3HFczo5q+dSG0gr7sDRHU1E+8kfKNMcUtkfpZG1
         +Wgvb0n+1Jd91qiACt8UexQEFRYzvGu6PQ9lWcizh9oBCax3i0HqavBgFUHu1bgE2g3f
         j1mENmvEtpW5XY+c7QMBr5wrhjDmMPZsWcshyP4ZPMlLG2eHMTOHgrY+8zowvaHFIZ/q
         fDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778097563; x=1778702363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BPFeHG3eQWm7h273qNIPgzRDB2uND5oH+mVxaZVS8FQ=;
        b=HQXOwmKUV+90JUu2opeDFNPACnj7VWtlKus+wsew5jsEWoekfany6IL5NMYO3ozs80
         9rLtiBU96mRxNkORkrNs5v2IPUjrg1FJZlZJP+G9RcsoO1MSt17jRE4kFHUW+Qa0eeu4
         lujEYZQP0E9zqVqxTHEHNIBmST4DgU1Q666ujPtamJE1HHsc7LOR0mS95yCx4tHvL0yG
         /3Mx/dEsnCs/oIfMGJJBbztK3f2iMGWCGR/VpOcE0Y8vntIqkIFyZ84cFZjeC2KQ075d
         IAOqSaojccfJKNt/AOTQ+5tuufFxlQLlQYIr9M4h9DgconAcY3jC7nPnFNg+0hesHYIn
         626A==
X-Forwarded-Encrypted: i=1; AFNElJ9GzOxZ1GiQgeGHXVK5LQ2CP+ESY5r3kPIVEr+kL3EA28xmwqrA9yZrDxpnF+wG8hNPkgGYvf6/QFXpQ8lwzFW/@lists.infradead.org
X-Gm-Message-State: AOJu0YzmgqeV2/iTIgcQbmUNpUpiDzzWhM5VLTjWT/V3npAXH7vfpp0w
	xx1v/J6XmYaFBMubseVeuOgiE4usSebW4GjCpTQBYmz9VLZZcSw9Frv3
X-Gm-Gg: AeBDiesfdK1jin8tgDhjyYTtisAz1BxTIkY7OgIcodQA74mzE1bTVX4IRJbX02YfZyn
	KHTP6CgPjuRk8RZYHbU9uu5wpt9iSMdBZOK5+COl7ZFShy4Gflf8dT6t41NbFq/waMS6kJ8mcex
	CS7GuSqQACjbteQSUX5kmkyhAL061cuLxCKb45BF1Jdz2bnjLNCH11DMvNTjumvJvrZ5Yt7Faob
	bsvPpjJTz+2DE2MZiXw+k574VCSc+A7kq4cfLOEz9IwIs/Aa6o+v/bY/dNclCbDyzL8iONkk0XA
	QS5h5HMcZWl46oB03sVuAVhAaIeWuqTHhudJpL8HDSUpiHBFai/WNJ0ch6Zt+di5C3iWo/0jT6z
	PnPfEUd17+fmfqaqPAE3wbeJjLzp650zSCD+mpTEyfYVmBwM7iQi79ir4irze8PSZjebe3KIhOD
	FkjcAerdwwsXw0hpSpVWZbpdWaDQOTf5wKiRa+3Qxd0jyMljtxlsIkimRpG73nTjwJBEeRGksUr
	NpTEjlPNoA=
X-Received: by 2002:a17:90b:3a8b:b0:364:8f64:49ea with SMTP id 98e67ed59e1d1-365ac795084mr4891618a91.27.1778097562894;
        Wed, 06 May 2026 12:59:22 -0700 (PDT)
Received: from localhost.localdomain ([115.110.225.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365b0058b30sm1935300a91.0.2026.05.06.12.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 12:59:22 -0700 (PDT)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
X-Google-Original-From: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
To: MD Danish Anwar <danishanwar@ti.com>,
	Parvathi Pudi <parvathi@couthit.com>
Cc: Roger Quadros <rogerq@kernel.org>,
	Mohan Reddy Putluru <pmohan@couthit.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: [PATCH net] net: ti: icssm-prueth: fix eth_ports_node leak in probe
Date: Thu,  7 May 2026 01:28:13 +0530
Message-Id: <20260506195813.641610-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_125924_313657_A52E11EF 
X-CRM114-Status: UNSURE (   9.82  )
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

The error path on of_property_read_u32() failure inside
icssm_prueth_probe() returns without putting eth_ports_node,
which was acquired before the for_each_child_of_node() loop.

Drop it before returning.

Fixes: 511f6c1ae093 ("net: ti: icssm-prueth: Adds ICSSM Ethernet driver")
Signed-off-by: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
---
 drivers/net/ethernet/ti/icssm/icssm_prueth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
index 53bbd9290904..b7e94244355a 100644
--- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
+++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
@@ -1825,6 +1825,7 @@ static int icssm_prueth_probe(struct platform_device *pdev)
 			dev_err(dev, "%pOF error reading port_id %d\n",
 				eth_node, ret);
 			of_node_put(eth_node);
+			of_node_put(eth_ports_node);
 			return ret;
 		}
 
-- 
2.25.1


