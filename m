Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B6FC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYA2CIsgrZt6V4pyp2QiijKavn3b9Wei4RC7spEsSzY=; b=V4A257TTrJC7PRlkY6qEa5Q4RI
	zzxX9tCpRdOrwymI7j27rW31WkrFNhaZYGN8taD+JOLM+odW1c/3GZc5g7YAqKVYkalig2UtIEXUg
	+Xs28ep6/QrKGysoJxlPR9mEc+wpTYZMQaBng8BQUjzmgHltDPauYPDxD8duomO3tWbfV19PFN4P4
	lX7HyG5GDd4B0RDhxKCjsi7lG9KwbTkptxzZBgM/6ESs/rhKw9ymbazhA6AgwcQtC4JYYd31nnXu6
	JFBzBfB4CyjaIxm8wv2Ax0O777x5X50I/OLN8MoVdd1wtHkT4s84HiLb6mq58tPO5JOYYLK3fVt0s
	f00W2x2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxyO-00000000Hum-1hM6;
	Tue, 25 Feb 2025 16:39:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmvfz-0000000HU7B-0uXJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:12:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 68ADC5C6B55;
	Tue, 25 Feb 2025 14:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F6BC4CEDD;
	Tue, 25 Feb 2025 14:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740492766;
	bh=NvPo81FgstGDBOyxIosqUZAVbYXZ9CECqX5dl0H62K4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YswEwNQXXiAVsklxtmnsq1gmjEwPcFkl54hj3TF2KOeanFvDwzWBvFsewuBjG5+Iu
	 t3+DMfZErX5AtZpMP2AtiVvJH/8SEmSzubXoaxm6AYfEFE/fwA5N7V9NWA2FLbyYdY
	 HXmV33AInxprc0f6FMyT1BhyznknK+ToHqXQXzvInVlJz826iSy0KD3igFPWXtFrjk
	 RXSujMAxqr1i8o6BHYUiMIaeakcaSyQXpJqkf9Lj1aUGFUIkK3GuYXaQBlLMmd63Ts
	 TTDfniP3euhytiCkv/eOUsHMmyksWyuvGnXp6+i2XQGn7OxXPXM/1X4OPqhXjxi3xS
	 SfMKyUCqhlQHQ==
Date: Tue, 25 Feb 2025 14:12:40 +0000
From: Simon Horman <horms@kernel.org>
To: Peter Hilber <quic_philber@quicinc.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	netdev@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
	"Ridoux, Julien" <ridouxj@amazon.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Parav Pandit <parav@nvidia.com>,
	Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, virtio-dev@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] virtio_rtc: Add PTP clocks
Message-ID: <20250225141240.GW1615191@kernel.org>
References: <20250219193306.1045-1-quic_philber@quicinc.com>
 <20250219193306.1045-3-quic_philber@quicinc.com>
 <20250224175618.GG1615191@kernel.org>
 <vhlhes7wepjrtfo6qsnw5tmtvw6pdt2tfi4woqdejlit5ruczj@4cs2yvffhx74>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vhlhes7wepjrtfo6qsnw5tmtvw6pdt2tfi4woqdejlit5ruczj@4cs2yvffhx74>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_061247_310699_B79FAEAB 
X-CRM114-Status: GOOD (  17.50  )
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

On Tue, Feb 25, 2025 at 12:28:24PM +0100, Peter Hilber wrote:
> On Mon, Feb 24, 2025 at 05:56:18PM +0000, Simon Horman wrote:
> > On Wed, Feb 19, 2025 at 08:32:57PM +0100, Peter Hilber wrote:
> > 
> > ...
> > 
> > > +/**
> > > + * viortc_ptp_gettimex64() - PTP clock gettimex64 op
> > > + *
> > 
> > Hi Peter,
> > 
> > Tooling recognises this as a kernel doc, and complains
> > that there is no documentation present for the function's
> > parameters: ptp, ts, and sts.
> > 
> > Flagged by W=1 builds.
> > 
> 
> Thanks, I will change the offending documentation to non kernel-doc. I
> was not aware that these warnings are always considered a problem.

Likewise, thanks.

I guess it depends on the subsystem. And perhaps this is fine for virtio.
But for Networking at large the rule of thumb is not to add new warnings.

