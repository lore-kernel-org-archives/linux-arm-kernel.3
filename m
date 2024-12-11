Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687A7E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 12:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=guSYvKx4mndllR6GD3MH3bmFmQytH3ODmZYWOudP6g8=; b=dnWopG9BlSF+HOOTqLxsjKYuCC
	zFS+E41awkgQ7jz+r6d3fEzBLn7ihClK9AMhRMrpvJc5eLwqtm143QF7GW3Jo7fvdYSR+1W+dne60
	ws3ID0T/SCPRwhHaMzSw0fnUccBVqF8WUFnxmjU849DuhD2KiSP/E0miM20zxFZMQsM/L+wHhATiF
	GWQIF1NM4iRQdEWKwChyaeR6+7/CsYKJcW1QVwflkPNBfTy+EEaiSGimhYB1SuFbV4Nsy38vRLLb+
	iesByy35mnCkM3XPrERA8MFjnt5X1pnge2sDmGtGdnMAADP67iUdJ8V1PqMlDAsIM87+yRJgQqpbg
	8a9v3K2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLLmp-0000000EorR-2gLH;
	Wed, 11 Dec 2024 12:25:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLLlm-0000000EojN-0v2o;
	Wed, 11 Dec 2024 12:24:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F01A75C66CF;
	Wed, 11 Dec 2024 12:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D61FC4CEDE;
	Wed, 11 Dec 2024 12:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733919885;
	bh=Ixe+0zlB0lslc06XHD6I5fHFiNcsd+/enywfypzEH6o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XiTFHF0Gio4QQBgKDhi02XZ6TrhhfqCQ4XjLKCuxPGw8w1e44rrWC56dhj2L5ClFG
	 uYA5axPUtkLuAJ1YETjMesPjrEuRNplG1r68SDUgie088ONVMUXiniZRhfAv7prR6k
	 PC8xg96LxqBzejT37TlCFNpoqcOzPVcDEcmgIQg2Ye7jNB88MbtUg0GRLMzny7S5YE
	 xXhxL3lRE2jmJTnGZtU9vtwCvKucR5rYviNGlUtgA54Dj4sENYskwh3G1o4h4fFll6
	 9V7fGE7FY74Tb35nlw51qNWXlpRtaqVITWJIt5q1HcyQsqknJmje/ZZxDRbe7Vs8w+
	 pgBk0Ivd4UKIQ==
Date: Wed, 11 Dec 2024 13:24:42 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Lee Jones <lee@kernel.org>
cc: =?ISO-8859-15?Q?Heiko_St=FCbner?= <heiko@sntech.de>, jic23@kernel.org, 
    robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
    jdelvare@suse.com, linux@roeck-us.net, srinivas.pandruvada@linux.intel.com, 
    bentiss@kernel.org, dmitry.torokhov@gmail.com, pavel@ucw.cz, 
    ukleinek@debian.org, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
    linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
    linux-leds@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v9 1/9] HID: hid-sensor-hub: don't use stale platform-data
 on remove
In-Reply-To: <20241211120844.GD7139@google.com>
Message-ID: <n914pn7o-pr9n-5ss0-p744-73402nnn843p@xreary.bet>
References: <20241107114712.538976-1-heiko@sntech.de> <20241107114712.538976-2-heiko@sntech.de> <nycvar.YFH.7.76.2411071358210.20286@cbobk.fhfr.pm> <4934964.GXAFRqVoOG@diego> <nycvar.YFH.7.76.2411071534110.20286@cbobk.fhfr.pm> <20241112143732.GG8552@google.com>
 <20241211120844.GD7139@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_042446_300048_025C8125 
X-CRM114-Status: GOOD (  14.82  )
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

On Wed, 11 Dec 2024, Lee Jones wrote:

> > > > This change was more or less a surprise find, because I wanted to make
> > > > the platform_data pointer in the mfd_cell struct const and this the hid
> > > > sensor hub stood out as doing something strange ;-) .
> > > > 
> > > > So patch 2 of this series actually depends on this change to not cause
> > > > build errors.
> > > 
> > > Ah, right.
> > > 
> > > > But seeing that we're after -rc6 alredy, I would assume the brunt of the 
> > > > mcu series might need to wait after 6.13-rc1 anyway - but I guess that 
> > > > depends on how Lee sees things ;-) .
> > > 
> > > OK, I am keeping my hands off it for the time being.
> > 
> > I can take it now with an Ack.
> 
> Looking to apply this set now.
> 
> Ack please.

I'd preferer if Srinivas could ack this as the more specific maintainer. 
Srinivas, please? 

Thanks,

-- 
Jiri Kosina
SUSE Labs


