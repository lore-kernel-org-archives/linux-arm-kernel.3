Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AD0FED3EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 16:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmsUIP7YIpHNwiP6IIanHNHPYrXErvUEhip0prSHU04=; b=Ty/1EYT8Z8N6N7T1b46ZEW++4g
	QzTcTyi3y5EwCYyUOWi7xfq8Y/wwJVB7VuQQ5oJny9zggRWNluurhe7VvXQ2KQGPXj632mM9PRJI5
	OtDo/9VQ3RHeT1ZMHH4e5F3e8JSwKT9MSTJMhCRvw6JZ2LZcHCs6GcRJQTJisCbXWrCZdauUjRhmk
	JBbqkeD9EtQg8s21Yq/nhUSfJKn9btaXD69plJXDj9a2708kOeoGoOG3g025tz6YCHL8H2HfC1J1J
	L0owJ2hbq8qcBcd1xy4fc8ZN8WiKcBXE42dwuXxv8QK8KgEKL2ehGjjTlT2KBni8BTUY4zScjzPz7
	Lby/KkLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJ7T-0000000DR8j-0Ko3;
	Fri, 24 Apr 2026 16:11:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGJ7P-0000000DR7T-209X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 16:11:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C0C6416CF;
	Fri, 24 Apr 2026 16:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36900C19425;
	Fri, 24 Apr 2026 16:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777047062;
	bh=Zsy6Ff45uWrYNi6Q5JvPcxoWdNhp3W2xNL5lDQCZHzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7Dj4YbNufgdQqfaeuBWv0WereEUAnEZ89rXk8uKzti/uEqb+9t4Y2f9G/42UCoAV
	 4OqLUN5rOrUHyxsiY3z6xQIZBWd9HFJSwV/lYWpKj2NUs1RCi1zvWpmqLC2mO4+Pv4
	 7tA7HMLIplN+kUuGWZmmKuB0x9lSJQWA3E9UF0spHiqvwwkkutlaCf30sNUfKAnW2Q
	 DhqS7B3Sqj8qorgLKoBuI7AW1m/cM1s4foXowSM/uZmOEnqiTmzqTQSCHGX9sVCq6S
	 bDdTpkyOowjF0at4J9ZjwCsT8w6HP/xmY8NAfWiBCzSnrIDAvdQ+nKeTgUVTW8GEJW
	 YZtfmnuj33uGQ==
Date: Fri, 24 Apr 2026 17:10:54 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan McDowell <noodles@earth.li>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	jarkko@kernel.org, jgg@ziepe.ca, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com, Yeoreum Yun <yeoreum.yun@arm.com>
Subject: Re: [RFC PATCH v3 3/4] Revert "tpm: tpm_crb_ffa: try to probe
 tpm_crb_ffa when it's built-in"
Message-ID: <20260424-agile-falcon-of-honor-4b23ab@sudeepholla>
References: <cover.1777036497.git.noodles@meta.com>
 <f8d6dcbeb5bf2d4316989d05dcaae20225774d51.1777036497.git.noodles@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8d6dcbeb5bf2d4316989d05dcaae20225774d51.1777036497.git.noodles@meta.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_091103_534934_49FCF054 
X-CRM114-Status: UNSURE (   8.44  )
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

On Fri, Apr 24, 2026 at 02:24:30PM +0100, Jonathan McDowell wrote:
> From: Yeoreum Yun <yeoreum.yun@arm.com>
> 
> This reverts commit 746d9e9f62a6e8ba0eba2b83fc61cfe7fa8797ce.
> 
> Now that IMA will retry in the late_initcall_sync level if the TPM is
> not available at first, this change is no longer required.
> 

Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

