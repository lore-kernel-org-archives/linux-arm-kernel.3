Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B19D5C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 20:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drGbI7MXeidstezmlwRHaw42Md50B8JUUxRUva8Crw4=; b=PGySC72j7m4FnXr3XqNvbrUyOw
	gRoSVvtW8lQnKOnmssKrniYVe/NU5Bacylse4/goFXm/kTO4/0B78ICDAfIXQy6IrlSFi6BOHwJsQ
	hiuIWqsPH1eNi2rPRidMGZ9txdwRCgCGbzMVIkc+28R3uI0PzsaoS8Rtb2ERxGwT8hdqe8MLdZC3x
	flPFkB+xJNK9HhVSjJTHPkxnRmvcttYWE6uTxfmeX9LGjeCZGYxNGw8Mdw7TVyHsCuiBsT/EZUalt
	shbz33JJYxgXbsAQKlAe/w5+r5t7boS06DUnkfmL7loQHrhFj7z3uZgJIaUqKmulzJzEjOtrh3VaH
	fv6aADtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkUw-00000008mde-3kKv;
	Thu, 27 Feb 2025 20:28:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnkSK-00000008mD5-1U15
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 20:26:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E46DB1516;
	Thu, 27 Feb 2025 12:26:18 -0800 (PST)
Received: from bogus (unknown [10.57.37.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5FDAB3F673;
	Thu, 27 Feb 2025 12:26:00 -0800 (PST)
Date: Thu, 27 Feb 2025 20:25:57 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sebastian Ene <sebastianene@google.com>
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, oliver.upton@linux.dev,
	snehalreddy@google.com, suzuki.poulose@arm.com,
	vdonnefort@google.com, will@kernel.org, yuzenghui@huawei.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v2 2/4] KVM: arm64: Move the ffa_to_linux definition to
 the ffa header
Message-ID: <20250227202557.d3fd6ylzbaho4pvx@bogus>
References: <20250227181750.3606372-1-sebastianene@google.com>
 <20250227181750.3606372-3-sebastianene@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227181750.3606372-3-sebastianene@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_122604_433369_D8D7CD6C 
X-CRM114-Status: UNSURE (   9.63  )
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

On Thu, Feb 27, 2025 at 06:17:47PM +0000, Sebastian Ene wrote:
> Keep the ffa_to_linux error map in the header and move it away
> from the arm ffa driver to make it accessible for other components.

Do you plan to push/target these changes for v6.15 ? If not, I can take
this patch with other FF-A changes in my tree for v6.15. Otherwise, it
is must go along with other changes.

--
Regards,
Sudeep

