Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F60B10ED67F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCrQTVxkz06bw05tCLEoN7JF7daOXEN4way6Og5+nFA=; b=R3ilsRfwTE4+coYPf+iwGmd0xK
	gsfLRVsnNwedi1BICBDB+9XLCOdjdwWG1Z6TSJaJWw7dqw9pD7jAo6pHDpJaJdLCKyO9voT7j6+ns
	BhZlVg/ZPn94cz/A+jrgzBk/nXOcafFSTeoEAbL5QGwkTnlhlX9BYCER5gIfW5Ee1lq2V0qE190Pf
	LIpfxzKfNCa0+t2sjHjBQEAp+/Ot9eSdfoBqZd6V/If/XdwROU/YRvAYtnBG91ZOaisoc4Dx/5wkp
	1DzYVmGqGKB++0Kyb5fkfEw0Zqt/Fz4VCG0h/Wb12O/D4W/QBz6tn3W3F4eHBMtlkEZSp9Bg+7LHz
	w5yPfDwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67rI-00000007ZPD-0wXe;
	Fri, 27 Mar 2026 14:08:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67rG-00000007ZP2-1q6r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:08:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B19C160103;
	Fri, 27 Mar 2026 14:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF114C19423;
	Fri, 27 Mar 2026 14:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620497;
	bh=HnA8ETQsgDpcCUdlQEWuDSTcbCCm9Lo2nX4QA+IIB+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bThLEwDWxgNDwYwAUpK4euQFxyy6s30djwOPHg8CLRrwx8XemW+6yE2nxcz55n49t
	 bZYvqrMtw59+8oP+7vTFMxuPvONXl1MrmvhoPcc48hDP61ChnC+xS7zRB6RnkBIot3
	 1gPbziHw8p6Q8qcziqWU9DtuN7ZvI1Vq5FFfG2RdVRGmQDP8WOFvwC1SKkmsJPF671
	 oLGdi+rBzVkijgN83HL+9RmZSSXK7YJt0yHpFrd0Bi0MMH7IePhqtzrsSk9CcL4CfY
	 QnXgYTdbPgatIgsR0N/5F3LUKVuBPQ44Oj3fA2NFxpfe38Q1I5zGeAqxhwDWgFdqlU
	 pxcfoVaIsOMpw==
Date: Fri, 27 Mar 2026 15:08:09 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Andre Draszik <andre.draszik@linaro.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	John Stultz <john.stultz@linaro.org>,
	Moritz Fischer <moritz.fischer@ettus.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [PATCH v20 06/10] power: reset: Add psci-reboot-mode driver
Message-ID: <acaPSW6VeYceoMnO@lpieralisi>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com>
 <CAMRc=MewwLTsaHCOR2iVYZRM6kWptQfZuTe=2i_pfpTwjFKEpQ@mail.gmail.com>
 <1f75b250-c3b5-45da-bc82-aeadf44dfea4@oss.qualcomm.com>
 <CAMRc=McUdboG0ziWmUf+h9mUiuGesaFk2v27z_Opbw-AF33C0g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McUdboG0ziWmUf+h9mUiuGesaFk2v27z_Opbw-AF33C0g@mail.gmail.com>
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

On Fri, Mar 06, 2026 at 02:32:46PM +0100, Bartosz Golaszewski wrote:
> On Thu, Mar 5, 2026 at 6:07 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
> >
> > >
> > > You should pass the address of this function in faux_device_ops instead of
> > > calling it directly.
> >
> > In last patch, we were using a probe function. As faux_device_create,
> > calls the probe from its internal operations, "of_node" can only be
> > assigned from inside of faux device probe.
> >
> > As our primary requirement is to assign reboot-mode of_node to the faux
> > device, thought to make it this way. (As we did not want to assign it
> > inside the faux device probe).
> >
> 
> TBH This sounds like a limitation of the faux device API. I'll Cc you
> on a patch proposing to extend it with the ability of using a firmware
> node to describe the device. If it works for you, you can integrate it
> into your series and use it.

What's the status on this matter ?

Thanks,
Lorenzo

