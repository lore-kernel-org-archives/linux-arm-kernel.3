Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A027AC55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dAlI38eiDu6eaVSXHMndTzRoYoxt7SivJ1LUIg7Ly9M=; b=CKucfqN/iN+yXtdNGYFUjYtGAq
	//+9GCzXDuGWUc6Bok1rmrE/4n6T8RCKrGQOhmLU9aj7Br+QxKTgXlVPXngNrmuq4IQ9wfmd+dNcl
	ayi5FfATzLudUDuaJi9m7RS7nNgD8uG08BaHpruokZo4DKXAVsrfhddt/xpKihfi6PZw3OpsYhXzu
	oTyoNIAtA11OCtgrCOSUvd6S9zHF6HlJ5YYOVNqdCbp/r0Ga1AbUKH7it9AXcCPxkvGymhYVd9mrU
	xE6zr6/4+dATkTpWcTpqfI1Xf8CkIJycs3pfSetHdCh9z5tFnX9+/qBqoQD0ayGTbaw8LJTtEzf7j
	AJEtN0tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9xs-00000001Gi6-3Yob;
	Tue, 04 Aug 2026 07:53:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9xm-00000001GhV-3xsK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:53:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16F64165C;
	Tue,  4 Aug 2026 00:53:18 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADA223FAF5;
	Tue,  4 Aug 2026 00:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785830002; bh=slUQ58mogfgqKmnDl7RHm0NwJU6ljctiO293tuFmyUM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ndev4MCC/wSB0yKuTYdRjWC6ZZrALcq9XdVn/ZczUtcWnLoN7kcTmtrek24djVEga
	 R3TN7iqzcVJGHeqcSYkxPSKlA53yFpXur+jcVJB7I3rFo0Uum2mBlScndUObMK7Y8N
	 x+HT9WhaKmqy39FaSmEDgC6Y14diZctJ9hSusPB4=
Message-ID: <6ddc4eab-1ec2-43f1-9fb1-310f5e8cba7b@arm.com>
Date: Tue, 4 Aug 2026 08:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: xilinx: replace OF with device handlers
To: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michal Simek <michal.simek@amd.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260803231823.95147-1-rosenp@gmail.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260803231823.95147-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_005327_073691_A29ADB07 
X-CRM114-Status: UNSURE (   7.07  )
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



On 04/08/2026 00:18, Rosen Penev wrote:
> All of these usages of OF handlers use the node from the
> platform_device. Use the device member to simplify slightly.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Thank you!

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

...

