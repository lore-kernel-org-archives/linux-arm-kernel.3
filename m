Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ABAC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 14:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptCiNT74n2ClApn0GPmUaC404n0sknElOCX6NQwLjW0=; b=OstnThLiVpBMVuw4GlCLHRpFJW
	6ks0rSCEp4etqNd81K5Fs7fKgi8dXQBe26pFeHRcVyqN5NSM1ZhlpsiXCiVzlQruVoFeWzjJ+92a/
	vzmG4Qej9XtF7AoVDNtA/otEZezphdNFJfHQMIwP3o4uIJBdJgEMgE6jQyOa97zs3nPBZjuCC5E8A
	791ukyw+OiCG9Mte87sLmAbxRmvu1nDzewbfH+byAbBnggUj4bNvSee47TfAuLQ2F6Iw20NL1j8Jk
	uEUU3ikRB9imO0bq3b08Xz1G3mpP6r9RkwrbISPRbi2VljoYVSjhE4y7mJIs17Z0LwM3qYqZAwTrz
	PX5cnMQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMJP-00000002zRV-16Ry;
	Mon, 27 Jul 2026 14:28:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMJO-00000002zRO-0ncv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 14:28:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A6B71403DE;
	Mon, 27 Jul 2026 14:28:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612161F000E9;
	Mon, 27 Jul 2026 14:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785162489;
	bh=ptCiNT74n2ClApn0GPmUaC404n0sknElOCX6NQwLjW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SvKvXXRd7ea3f/0AmXK7+cSSqgTyE/JREJX+W4fmWFUoXtiNbIXyAvKkAHzNuBynu
	 y8tLAI4uPBxubfJGOxi050VNRH9jEyJhYYoz/k7AH9BMKkcXtflVxflSBuv2aqYMqO
	 ZbA94Ind3ewx2l8/mrvmu4ceVFUaZuddAB51Vtywt2vq7smcWeya1GMurP5nxtG6Iv
	 2PZw6n0x6dSTblPwqlA+ax7bRVyCEHyoVnBGQJ0nnl5tlPFxKGsYyJ7RlypQMZeMXp
	 qy4YMEoLH7MBUnSD7FtC2y/vDhgnbLf+mnkGRt8gwOuBhIju6CPBr4JvlyXK5c+Ayb
	 IMPuxdYMaBNiw==
Date: Mon, 27 Jul 2026 15:28:03 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
Cc: Cristian Marussi <Cristian.Marussi@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"d-gole@ti.com" <d-gole@ti.com>,
	"david@kernel.org" <david@kernel.org>,
	Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
	Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"subrahmanya.lingappa@oss.qualcomm.com" <subrahmanya.lingappa@oss.qualcomm.com>,
	"usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v6 00/22] Introduce SCMI Telemetry support
Message-ID: <20260727-bouncy-slim-badger-bad63e@sudeepholla>
References: <DB9PR08MB86510C934D2EF25F625A5F38FFCC2@DB9PR08MB8651.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB9PR08MB86510C934D2EF25F625A5F38FFCC2@DB9PR08MB8651.eurprd08.prod.outlook.com>
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

Hi Fayssal,

On Mon, Jul 27, 2026 at 01:53:45PM +0000, Fayssal Benmlih wrote:
> Hi Cristian,
> 
> Thanks for V6. It addresses a useful subset of the V5 feedback: the
> uninitialized feature flags, signed exponent, group bounds, bool casts,
> SHMTI enumeration loop, scoped ioctl magic, compat support, binary-only
> interface, ABI information, reset, and oversized mmap requests are fixed.
> 

Appreciate your efforts in reviewing this series. But the below format
of dumping all the review comments in one place is neither the normal
mailing list practice nor much useful for other reviewer to follow as
one need to map/follow these when reading corresponding code which is
painful IMO.

You can look at other threads on the list for reference or we even have
an AI(sashiko) which does inline reviewing[1].

It will be really helpful if you can switch to that mode for future versions
or comments.

-- 
Regards,
Sudeep

[1] https://sashiko.dev/#/patchset/20260724144430.1440170-1-cristian.marussi@arm.com

