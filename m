Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B638CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 05:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4/6Lc/+651vbxRHr5V6jKndyAO/QJF1z4yHsnYQ6O0=; b=uF7UzQk2MzDyotHPWrok0KZNGc
	BPz85yjgc3C6Q/NYb2m7wxZkzo1q+I5wMivEltEoG9clE2aPBj+DA2VhxLMwI143ceZ8oRF9YDNJk
	PWrjvCzlFpqTNDfRo0AGqUOQj3E2G6KtPd/txJizdRBeUDrY+rGTWUcPwfhUTXeJUus+dPHVbyeTr
	J2isS+SY6kySkolQh/5Xbw2hzZSvilqvZ5gbUoSLHLQFOOHmybaqgcfBRiwZhlIg3k9qDk5LVw+rE
	8cVgWEWiArP8mqMADaf9eucA5DZWDUIrOdn0Q85pICPn8nI2r+ePG3ZiXGylavDg/DSG11bJ4A22w
	K14lZ02A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYGuY-0000000By8I-2icr;
	Sat, 13 Jun 2026 05:28:02 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYGuU-0000000By85-3rEg;
	Sat, 13 Jun 2026 05:27:59 +0000
Message-ID: <bcd5576a-5d4c-44f6-a773-2344ba8c6432@infradead.org>
Date: Fri, 12 Jun 2026 22:27:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 20/31] fs/stlmfs: Document ARM SCMI Telemetry
 filesystem
To: Cristian Marussi <cristian.marussi@arm.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org, james.quinlan@broadcom.com,
 f.fainelli@gmail.com, vincent.guittot@linaro.org, etienne.carriere@st.com,
 peng.fan@oss.nxp.com, michal.simek@amd.com, d-gole@ti.com, jic23@kernel.org,
 elif.topuz@arm.com, lukasz.luba@arm.com, philip.radford@arm.com,
 brauner@kernel.org, souvik.chakravarty@arm.com, leitao@kernel.org,
 kas@kernel.org, puranjay@kernel.org, usama.arif@linux.dev,
 kernel-team@meta.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
 <20260612223802.1337232-21-cristian.marussi@arm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260612223802.1337232-21-cristian.marussi@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 6/12/26 3:37 PM, Cristian Marussi wrote:

> +Design
> +======
> +
> +STLMFS is a pseudo filesystem used to expose ARM SCMI Telemetry data
> +discovered dynamically at run-time via SCMI.
> +
> +Inodes are all dynamically created at mount-time from a dedicated
> +kmem_cache based on the gathered available SCMI Telemetry information.
> +
> +Since inodes represent the discovered Telemetry entities, which in turn are
> +statically defined at the platform level and immutable throughout the same
> +session (boot), allocated inodes are freed only at unmount-time and the
> +user is not allowed to delete or create any kind of file within the STLMFS
> +filesystem after mount has completed.
> +
> +A single instance of STLMFS is created at the filesystem level, using
> +get_tree_single(), given that the same SCMI backend entities will be
> +involved no matter how many times you mount it.
> +
> +STLMFS configurations gets appplied by issuing the related SCMI commands to

                         get applied
or better:
                         are applied

> +the backend SCMI platform server: for such reason any configuration applied
> +by this FS interface will survive the unmount or the unload of the module, but
> +not a reboot.

-- 
~Randy


