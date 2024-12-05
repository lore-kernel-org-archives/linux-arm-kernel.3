Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0123BE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 10:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvjP73SRyI7DohNuKBh6XtndiDZoOsCEkKSd3XZyTnY=; b=xUFy2ubQNKJ2tKpFcyHxQGxneY
	77OKndgjXZKgYr393o2rLRgFsyoozPmeeSWAWNJSuCXWIMnAiWUDtM5q5aFC7IGrGQTz473sVS+V0
	10NZ/0ofvbxS93e4jM7sVPI6dHDyQIYYZrYUBf4v+Gqqj7MNZSTN7uEhSBiewpxxPgS1lVzX28cs2
	QNWq/H3q1JZzT+g0Zvg0ml6Wq54exuEH4Zj7uafYwLxKPu5cu/6lLTpXR6Vuio+0Z7kyD0oGocYXx
	nXbWDkqf8HbL2rJVpZKqyNbfrdG2CxDo7frdzXOytOGIk9aSdkrU7ZVLtKJ2muFyoAbsc1ggHKWZx
	MMSt2RQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Dn-0000000FXgR-2gzh;
	Thu, 05 Dec 2024 10:36:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Cl-0000000FXUH-2vxN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 10:35:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41174FEC;
	Thu,  5 Dec 2024 02:35:59 -0800 (PST)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 574A23F5A1;
	Thu,  5 Dec 2024 02:35:30 -0800 (PST)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nd@arm.com
Subject: Re: [PATCH v2 0/2] small fixes for arm_ffa driver
Date: Thu,  5 Dec 2024 10:35:03 +0000
Message-Id: <173339480142.692288.1444653013736952859.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203143109.1030514-1-yeoreum.yun@arm.com>
References: <20241203143109.1030514-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023531_782723_709AF4F0 
X-CRM114-Status: UNSURE (   7.94  )
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

On Tue, 03 Dec 2024 14:31:07 +0000, Yeoreum Yun wrote:
> This patchset small fixes for arm_ffa driver:
>     - change ffa_device_register()'s declaration and its return value.
>     - fix direct message request version 2 uuid setup.
>
>
> v1 -> v2:
>     - Restore error return in ffa_device_register().
>     - change type __be64 to unsigned long to suppress warning.
>
> [...]

Applied with some reformating/reworking of the commit messages including
$subject change to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/2] firmware/arm_ffa: change ffa_device_register()'s parameters and return
      https://git.kernel.org/sudeep.holla/c/6fe437cfe2cd
[2/2] firmware/arm_ffa: remove __le64_to_cpu() when set uuid for direct msg v2
      https://git.kernel.org/sudeep.holla/c/81c8b1c2ef7a
--
Regards,
Sudeep


