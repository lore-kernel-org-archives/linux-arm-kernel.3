Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FCF0C79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 00:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lm7BcEa8+Jgt9xkhmMJfF26Iq1SFFXivMsEEThtEiJo=; b=ORV+A9tAdgIOYLr1pDmtrlNVCn
	8q9P14uMjH9xOJOjSMtVv6nwijT1K7hh7N/CnpNnkMCtjq5qp8ClzpJtUXbzCRVn8BuBFkE+cAF/F
	uVoKoYkVzXbG7ZyL+MuJKl00cTDdaWPj3x/XYwAfkv8n8tBXYy1SvVDQKT7lHKdyJLAsAQ/R3cmi6
	Un9ca5mCIQ5eu0INiCmx1jKjrOW2XsTRPv0uGD1txZhH8Jj3U/qqEwkxcFkI3flFnHg2DnqyORHXK
	KiegqfOtJmYpIIFdsGBo9SRM/+WZRh+0csB193kSXvA1vlyw2vDf4mNzJjV4kMLW2EhqZpubGsy+a
	cp06ACgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46Jq-0000000AViI-3xca;
	Wed, 09 Sep 2026 00:37:42 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x46Jo-0000000AVfl-3Bsm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 00:37:41 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so522741a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 17:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914260; x=1789519060; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lm7BcEa8+Jgt9xkhmMJfF26Iq1SFFXivMsEEThtEiJo=;
        b=cRjnH5qCsjXKPt7IODQx96IJrzwrYuZ9+COQJZMCZmnTHSe+RDn0XLGLhp4+gTrTFg
         Ij96wBXPX/VakTNLLeiGM1FW0lpjtbExBo+qxEczfKTpiYcdnFG7zkc/zs9d2Kbc4e2x
         nin63sAVE1VKamMqn/M3k4SVr2QZZZPRLQZEmCRGEWwpcyhidMADaimBJM9wagGu7JIT
         cKouVhSXZqs7pBzF6bAh87XfXlaAiuY3KQ/DGF+Fsa8H56rXCKbIbUpzadf+TAiG11tx
         sv4sLiQTSCbLlKmY1HoFamFs8v4LeF4ffyNdD4Fq6BTOBufVItHA5Vm/NK4Sh98XxD9B
         qMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914260; x=1789519060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lm7BcEa8+Jgt9xkhmMJfF26Iq1SFFXivMsEEThtEiJo=;
        b=VdyLRrx5trhEJJNhMgZwq+ls1idGHcDFLNZWlcgBEZlSCaqJhXWYlTwAAIG3qFQMwZ
         dM49M8AjTT6OhJPJajsQProwc/gPb0sdlX0oexatDmTscZnZVmjkUBpLcYKETuzE27GZ
         KmvUoXPJIBKayuP4lKwYK8ieok4Zdrwy7dymiiy/Z7idr0U9kxO4MiQGHVxI0gnAP6/9
         9bzbjdmVpOrgZbyeVNX5MJQflfcSjgRsrEjXZjMUEj6Kkp7OwEcRTIPAlrdgpKs5Qo7f
         PTvsL2XgoDAmGXZUfrpNxaXhRwyLaEUf9G+KHI/qdoAaJoz0wYjsTPpcvmxaotzyVn7E
         /Z2A==
X-Forwarded-Encrypted: i=1; AKwUvBzIt9HiDgZOz5JBDbmtjcW5l1N/AQX04XXCFSCMz++0LQnzRs7vmVlv+p9lZlj+4pH9JYpxQgqP6TVLtOiYDhic@lists.infradead.org
X-Gm-Message-State: AFuF++lYnZ2VQwgpKNpONhKk47YtcjijB3tLAX5pZm6/RSKQyGA08dSm
	h0Xa8aI+Df3KlP5Celc9gb+sRuXWfkeVq/qmBlJiQn4u5O26bwPnqY0q
X-Gm-Gg: AYBFou1i6wHvzNIYN/WmB4qfcnYThNR5eH8Mb704PUPOVe7zitMdKWev2IIxdTa7bqH
	mFPfo/tchmGNQ3m2bjn2D6DvARx4HIdpvU2CvDBpNdaqJOen1WX7zqWFP0SZmffg/AGi6HBh3Sp
	TkWSkzT2KQvTdc2MdmW7I4khfIDxWPiX7c1uodQTDU9EWatNsfvEEc2uQHh2Ah5//aIuuhiN9vk
	UiEMr/NCph8A+LtgIxksHgeE2oB/9xYBhjqSKT9QUl9+vkdhbsaunsHZT1IRscPjpdJ2xhJLyPk
	CH80LdFoiSYP5lEwxUKDabqYAvIBczmjQY9DNHuz1zA+/pVSRtnfy7LvwVb1XQx9eJfw2mKUqgT
	53cu2GASBTsFiacMR9mH0OKY2S1geYIH4o2qBm/K7ARwrpKZbc2jXbxhcfyQBmprlHhJsd7Yhzj
	tgd6G/AUx4ahhzb207P3wKQxQhF9BRFIWdAJmL8p8atl0JMGLm6Dw3gULfZlqV
X-Received: by 2002:a17:90b:58eb:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b8bf497edmr7501490a91.15.1788914260009;
        Tue, 08 Sep 2026 17:37:40 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d845sm35551055a91.17.2026.09.08.17.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:39 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 9/9] Documentation: kdump: Add arm64 and ppc64le to encrypted dump target support list
Date: Wed,  9 Sep 2026 08:36:51 +0800
Message-ID: <20260909003657.1570544-10-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_173740_831419_45A9A784 
X-CRM114-Status: GOOD (  13.01  )
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

The encrypted dump target support is now extended to arm64 and ppc64le.

Fixes: e3a84be1ec2f ("arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel")
Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 Documentation/admin-guide/kdump/kdump.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 0bf2eb100a05..36ad6125c670 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -572,8 +572,8 @@ Write the dump file to encrypted disk volume
 ============================================
 
 CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to an
-encrypted disk volume (only x86_64 supported for now). User space can interact
-with /sys/kernel/config/crash_dm_crypt_keys for setup,
+encrypted disk volume (only x86_64, arm64, ppc64le supported for now). User
+space can interact with /sys/kernel/config/crash_dm_crypt_keys for setup,
 
 1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
     # Add key #1
-- 
2.55.0


