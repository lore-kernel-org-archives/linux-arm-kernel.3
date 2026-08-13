Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E72C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 03:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SXT+TFtZILC9kput4/TKXz12rDzU5NmQQ01pk2ZkiiM=; b=KXdwequygKjlpQ7s1HJd1PGamo
	omrUsymk47bThx8H5CAGNv/I5uql0kk9zKT11bIduP4alGhOP/ZxjEVbIRYPU+TQwq2bjjiOlEbIy
	y6WZzTAQheDhpC/thE75qX1rODu48uD9b1RZurhGAksZgiBfV3+njyycnF3VIPNIZddOU2nwOnWpN
	kVcaVgCbY89i72bzMUqJl0jeXr2lXOZhmTRxt4vfAc+CHDd1QsTJ8oV+MXSBdC0uHJVDtrzDXjzFj
	+bGyEGnd6Vqp1Nfu3IUgSRYogeAQb69p+q2fUaoTKw5/7MRMn1qI27lNFrnpzQICvwZ90O04esBRt
	8zV3MkoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuLnb-0000000HIqo-3dqE;
	Thu, 13 Aug 2026 03:08:07 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuLnY-0000000HIpt-0bNz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 03:08:05 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso1358021a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 20:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786590482; x=1787195282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXT+TFtZILC9kput4/TKXz12rDzU5NmQQ01pk2ZkiiM=;
        b=d+skxO0PoaItcFYXn1FTUsGWiwi87z6eXGBxThWXWhSDRwt5WsjVkq8vaMSimVIPnv
         twTB/M7Pvst0FkKJTtJ2epj5b/EuSycHY+HkC92N5fQkvlv6vJnVz/1hnGlHCnQTNNN8
         kRJNR+swfdIjXOgxcEXPpA7Z/Ts+904TBO//NZ3QfrITPh+kOUMf8pxn3PBW4BB+d0q+
         K/SJmwBP2QI4Jll82+KosjsgNfzQSbXuokAug824WLmZnLJTLlNhSjqTcwemA6xuwWQR
         BR5rS0AJGzZwUEt2ykRH6JSDw73jP93m4z6EVccsie5Ep/pJyy9ulmq5qPdMIsBfBIC1
         MqXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786590482; x=1787195282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXT+TFtZILC9kput4/TKXz12rDzU5NmQQ01pk2ZkiiM=;
        b=iEZVjAo4KTgQoV9EdGcVWBArpU//vjXn3fUZoL/UDql2eRjERng9a8RhFLVs5DXP3S
         VMfrKWdRif/cm7+zILojy6x9whu0wojCQt5mulVsX1NdMIsymuq3cLf8E8swS8qijudl
         3HwHbc5rPh1KMYOXdSmVuPGBpXB0hBlHwIHUwXDyDpA0rrw/9KS6RzmXaP9iL7wKkkgB
         C1hmUTHUiv3GBv9Ee/mC23JjSvXiHu+W5besOnXj5G8vxGD19kUJvQzIKZ7qGWuCjhS2
         PVdN2MZfjRxaS1aHwIjxa6NV0tHqdELGqqdIbuXOAfzePHrXc0Q61slhHVuhylbQv0pv
         YNdw==
X-Forwarded-Encrypted: i=1; AHgh+RqnaZ2wEwvnnNK9YZmOcBjnOMh0koYlnwo/+d+5qn6wEOllqshgE0X6s6BFUvt16IFrTWirvHRbqlNxrJD6Z5Ij@lists.infradead.org
X-Gm-Message-State: AOJu0YzHzpAX7DzkB/94Kr+VnSbwIZhxuUiqsgDu04LPUJ6t5JIFdmhW
	k/GG5iFZLUnRGnXdeMdTwwYHl3qCGIyrIrRcue8R0+s+LaZIMy9vz3jH
X-Gm-Gg: AR+sD12oSXP48BRnNgw0jbyntrqZB0xQC87/7ZgrHMVCeB+/v6XpZKN63Yflm1TOnUV
	imZw+watVcr78hQgr68VL10KFyWNnq00gQzSY9H2S/9FVikrS0hEoFyeuOXddtbtvjKrGn00JRy
	wshXv89s89UsG+O4KfCJTXEAeeNUad3UG9luE4XNC2qqiJM8ZIL6GdHBa+R5D0nzZeA4cf8qrPU
	N0QdrqvI/l8766lS7TobJvBWJWn/qmplZwf+UKkQIg00eV7FPz5UZfiUz09JAZq1A4FfS0mA4PN
	mMZ5cSMfA+JSMEs1P9acgM86kAgq7e3L/4Y/vxZGF9AttTCuVJd1KDXTqPLNj4UUp91SnxAMDj5
	w7/2LjqtWRgz1XT/8ovASUVy1d20eTXcg4SClCBRn1CR3OYFfnVnyEzhZimg02Djrl8q30YT2Oi
	iLHtRIE3Uf6wKxHf/0FMotHd+Wt2DjnO1MuTzugxDBbEoNPjRSHvZVOdF20b/I/chtaXFrWU6mb
	t5Ks8CmvcLRZoM+UA==
X-Received: by 2002:a05:6a21:7002:b0:3cb:eca6:ce5 with SMTP id adf61e73a8af0-3cc5539af60mr3994167637.24.1786590482312;
        Wed, 12 Aug 2026 20:08:02 -0700 (PDT)
Received: from sdklog.tvstore.opera.com ([2804:1b3:a8c0:46f0:6d62:6c3f:1af0:ff3c])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebf731f95sm2249048eec.15.2026.08.12.20.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 20:08:01 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org
Cc: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Subject: [PATCH net-next] selftests: net: separate ipv6_flowlabel_mgr test
Date: Thu, 13 Aug 2026 00:07:05 -0300
Message-ID: <20260813030708.37609-1-marcelomspessoto@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_200804_186502_8D882FFE 
X-CRM114-Status: GOOD (  11.65  )
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

The ipv6_flowlabel_mgr used to be a component of a broader overall
flow label test, defined in the ipv6_flowlabel.sh file. This wrapper
script called tests defined on ipv6_flowlabel.c and
ipv6_flowlabel_mgr.c files, using predefined parameters and enforcing
the in_netns.sh helper to set network namespaces for each test env.

However, the ipv6_flowlabel_mgr.c was drastically changed recently.
These modifications led to the mgr tests becoming a self contained and
independent test suite, enforcing netns creation by itself and
not relying on the ipv6_flowlabel.sh wrapper for proper test execution
anymore. Therefore, remove the mgr tests from the wrapper and update
the Makefile to handle it as a standalone test program instead.

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
---
 tools/testing/selftests/net/Makefile          | 2 +-
 tools/testing/selftests/net/ipv6_flowlabel.sh | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index ab890e6f79dd..0f5c178bc224 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -150,7 +150,6 @@ TEST_GEN_FILES := \
 	ip_local_port_range \
 	ipsec \
 	ipv6_flowlabel \
-	ipv6_flowlabel_mgr \
 	msg_zerocopy \
 	nettest \
 	psock_fanout \
@@ -183,6 +182,7 @@ TEST_GEN_PROGS := \
 	epoll_busy_poll \
 	getsockopt_iter \
 	icmp_rfc4884 \
+	ipv6_flowlabel_mgr \
 	ipv6_fragmentation \
 	proc_net_pktgen \
 	reuseaddr_conflict \
diff --git a/tools/testing/selftests/net/ipv6_flowlabel.sh b/tools/testing/selftests/net/ipv6_flowlabel.sh
index 2eeda39bf64c..5d1b5464c54c 100755
--- a/tools/testing/selftests/net/ipv6_flowlabel.sh
+++ b/tools/testing/selftests/net/ipv6_flowlabel.sh
@@ -7,9 +7,6 @@
 
 set -e
 
-echo "TEST management"
-./ipv6_flowlabel_mgr
-
 echo "TEST datapath"
 ./in_netns.sh \
   sh -c 'sysctl -q -w net.ipv6.auto_flowlabels=0 && ./ipv6_flowlabel -l 1'
-- 
2.55.0


