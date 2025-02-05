Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E44C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 19:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhYh0K0cs6hRJ2EkOy56lZy1JN8Whdz+VjNW5lkSwwA=; b=xsKfhZTw9/R6DrO6h7CTke1Ngu
	7gnR4Mi44yErk1qeWl27qy4Fyp+J1KDDOS+GeNgJLwhMD/n7QkSM9fOvUUggNNLiCqSt/lIOt5IhC
	Tu2U8aTnxbxi+ujko++fADKdNlOWUxMTSk00BLHAexDsVdAXUxZOlCa1nw436SnS0zTYzFlT5OUth
	TUQUh5YnhxcVCARGZ8tQRTmSlEY3eKQCYE+edGhRPAoeDJLEbv+ZmwG6AzSjZNFY752e5GdpYz5ft
	9ljFL6Xnf/OHxOvbVntot/ogSYq5rp3/HySYYBJGrl+TC3mcoqtDTX3tFz42JnrnK4tV/9MNmfC+y
	EuSjR67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfksi-00000004NWZ-2eCl;
	Wed, 05 Feb 2025 19:16:16 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfjjs-00000004ByD-0IRt;
	Wed, 05 Feb 2025 18:03:05 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Yp7Pg4mNTzlgTwJ;
	Wed,  5 Feb 2025 18:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738778574; x=1741370575; bh=MhYh0K0cs6hRJ2EkOy56lZy1
	JN8Whdz+VjNW5lkSwwA=; b=KgqAQ+ZyBTnOrx4lrw7J5MNMgRb9DWfwiFF+nyfE
	0ECqUOSNnBEMfFYO5vah6+KGICdbDdJqrNb4JMogDb29erGrkDZeyeatDqpIxn0W
	Gp77cx3Ar3deNjqZYOEx8e3LSUFd/I4Jvd2pJVqJa7fysnXrgxR4QFVyJz38g4mZ
	68GwmE9kpsy7WF54QEBKGGxHOqn80Sh/W0q69MbvsUt1oYdgpZ4YscY6SZxryEbK
	kDV0hLPJY53bDXayl9uxuL/famauO2GvCy3km08peZo394QSwikrd1hAJ8uvz0tw
	S9+vtOkM0LYo5Of+ZbDtU0ovn/0eKixBDrhFElAf87YjHA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id yPbHVnEeDhAD; Wed,  5 Feb 2025 18:02:54 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Yp7PJ56d7zlgTw2;
	Wed,  5 Feb 2025 18:02:44 +0000 (UTC)
Message-ID: <45a2da01-966f-4019-8d7f-ee2b66575804@acm.org>
Date: Wed, 5 Feb 2025 10:02:42 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] scsi: ufs: core: Pass target_freq to
 clk_scale_notify() vop
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 mani@kernel.org, beanhuo@micron.com, avri.altman@wdc.com,
 junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew Halaney <ahalaney@redhat.com>, Eric Biggers <ebiggers@google.com>,
 Minwoo Im <minwoo.im@samsung.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
 <20250203081109.1614395-2-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250203081109.1614395-2-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_100304_134071_C20DE724 
X-CRM114-Status: UNSURE (   8.63  )
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

On 2/3/25 12:11 AM, Ziqi Chen wrote:
> Instead of only two frequencies, if OPP V2 is used, the UFS devfreq clock
> scaling may scale the clock among multiple frequencies, so just passing
> up/down to vop clk_scale_notify() is not enough to cover the intermediate
> clock freqs between the min and max freqs. Hence pass the target_freq ,
> which will be used in successive commits, to clk_scale_notify() to allow
> the vop to perform corresponding configurations with regard to the clock
> freqs.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

