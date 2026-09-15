Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B172EC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R8EnJl10YJOY5Nkon1MY2df+AJVu+cW/izK3OP3v3UQ=; b=TRXPa3tWnkFUAK2ikFr25eDUyM
	/HmMvSyEs0BhADtIqL9WJgrrjRaR4htozPca6kvPzcW1JH3q9UqexzwS6Gx5BGLlCIRoPGluRXQ2Z
	B4LRbbJ3bms2Re1yoBanQ1al1y58Tnu2nYoS/RyWKdnA9Q2rDegfqulhkqGnymde2HyZaGw9Yio+k
	TalOX20kXEOXxcgVzxqYFpxTllt71ilWybSMOLkIWm43U8EE5gxk2vTFMz3Cy4SYIKFzq83ZgXexd
	wL1SVMRyt6Fv/yv+JeGf1VyiiYglZ6X3qTgtYDEeN2MyjbBrRo3NeLeIjow2f/ax42q9MiB266YtT
	ITEfUozA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6U2Z-00000006urF-4ATF;
	Tue, 15 Sep 2026 14:21:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6U2X-00000006uqd-3se0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 14:21:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 45484600C8;
	Tue, 15 Sep 2026 14:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021D81F00893;
	Tue, 15 Sep 2026 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789482101;
	bh=R8EnJl10YJOY5Nkon1MY2df+AJVu+cW/izK3OP3v3UQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kmSFdEPAWUSs3E9BrHKMAj8s3+D1dsrTeO+rJFSK/jatNYydFei8hG/r3hMOZvu4h
	 vjY7XF8zHnBo7U12S0muktc47OhTdKfLUcprwcN46Pn0kZzHs6/NP9nT1/aa0v00Tl
	 /B6u7Ah591zmziN8xsmp9Se0YbAmjh0NPTtQ+utxB4QO9BZjPcmsyVISXCnnV4X2uL
	 v8arA9xBKOMln8jQZwNncUYMVKQJ0wpqPs+DUc2uZ4s/mAlTa7ycH5UztCzQSB5Ykz
	 fj4ePGM7RuSOeXoNgaDsDKm1GtpK6XnidPnIc7c8Qxhpv3LA9GynYe+QRjHXGM0xIo
	 9XiZUUF9+terw==
Date: Tue, 15 Sep 2026 15:21:36 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] firmware: arm_scmi: Fix
 scmi_protocol_device_unrequest() race
Message-ID: <20260915-messy-imposing-frog-ea9338@sudeepholla>
References: <20260911152329.5822-1-johannes.goede@oss.qualcomm.com>
 <20260911152329.5822-4-johannes.goede@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911152329.5822-4-johannes.goede@oss.qualcomm.com>
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

On Fri, Sep 11, 2026 at 05:23:28PM +0200, Hans de Goede wrote:
> scmi_protocol_device_unrequest() unlocks scmi_requested_devices_mtx during
> the notifier call. During this window phead might have been deleted by
> another racing scmi_protocol_device_unrequest().
> 
> Re-acquire phead before cleaning it up to avoid this potential double
> free problem.
>

Does the below address this issue already ?
Commit 2c4097e6c4ae ("firmware: arm_scmi: Fix requested device removal race")

-- 
Regards,
Sudeep

