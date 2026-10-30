Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBF1606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2JqBamR+;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=aySlwDMJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GSTHr6nh7zIc64buOK91QH68PTZCFEuCdTatPpTgfSg=; b=2JqBamR+SB7k2o
	1rhaVD4GxImYJd7740uWPZZy+KsRp9TLmFTjGg6Mr98z28g+nI747ApEf982zCI4v6kLLbz6KfAVQ
	hoay0glm5BLR0kCM9mcaFc94cMtdgOo/ratxaki1bm+4GgYuDM8aqpUyWdFtNMdqfPM7QUqaLZkNd
	pzy32EpqHEgcARuaugc6sVAARGSkzcXIJoYrYyXj2E0H/vvvo8kqB2NCP42SbPcwyxQRx/c0YMDCn
	JI4KyQTI7sUBAbMD7V9pOfurmj9F2IJsPSQQ9uueuKXIou+7NW6R6TUSbgNCDBwZE22THjOnJbG7j
	e48WO9i8GkG5BEpKA75w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnB2-0000000BoY9-2kTP;
	Fri, 30 Oct 2026 14:01:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnB0-0000000BoW7-0YZV;
	Fri, 30 Oct 2026 14:01:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76F7C153B;
	Fri, 30 Oct 2026 07:01:42 -0700 (PDT)
Received: from [10.57.13.127] (unknown [10.57.13.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B65D3F59E;
	Fri, 30 Oct 2026 07:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793368905; bh=CBjM/kgm7b93hD/XSBn5BtbWlBow9tnu8Mo8LQbm7zM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aySlwDMJuejp2HuAywHeZq+ls0uUKG/LHhdsHM6Tf+m786W/OIpykVTHBZrovBhA2
	 n0F0cnlMhP3dlBiEWvO1gbjRM344iHuuFtiA8KeLLIol3ykSAZHO4pvkUymgkl9NaL
	 fBGjzlKB7JLUD/1lji2qfcUzoeHH0FeVgM9NS5yI=
Message-ID: <dc1d68fc-e4fd-4cce-9444-acc8031d5ba0@arm.com>
Date: Fri, 30 Oct 2026 14:02:13 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] powercap: Add generic zone hierarchy creation
 helpers
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kselftest@vger.kernel.org
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
 <78abd10309b51ffdc3304997376d58e55b29487c.1793288783.git.daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <78abd10309b51ffdc3304997376d58e55b29487c.1793288783.git.daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070150_220692_8646FDAF 
X-CRM114-Status: GOOD (  12.79  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/29/26 16:56, Daniel Lezcano wrote:
> Powercap controllers may need to create several powercap zones organized
> as a hierarchy. At present, each controller has to open-code the
> hierarchy traversal, parent lookup, error rollback and reverse-order
> destruction.
> 
> Introduce struct powercap_hierarchy to describe a powercap
> hierarchy. Each node contains its name, parent, backend-specific data
> and the powercap zone created for it.

[snip]

> 
> Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Link: https://patch.msgid.link/20260806110159.69690-2-daniel.lezcano@oss.qualcomm.com
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
> Changes in v4 (since v3):
> - Rebase on v7.3; no code or commit-description changes.
> 
> Changes in v3 (since v2):
> - Rebase on v7.3-rc7.
> - Add a static initializer and clarify hierarchy ownership and locking.
> - Check for existing zones and validate names and parent ordering before
>    creation; use zone for the runtime pointer member.
> - Allow NULL callback results to skip branches; keep errors fatal.
> - Use explicit locking and a signed reverse-loop index.
> - Explain the controller callbacks, their arguments and their relationship
>    to zone operations; update the description.
> 
>   drivers/powercap/powercap_sys.c | 204 +++++++++++++++++++++++++++++++
>   include/linux/powercap.h        | 205 ++++++++++++++++++++++++++++++++
>   2 files changed, 409 insertions(+)
> 
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

