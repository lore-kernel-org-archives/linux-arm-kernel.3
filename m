Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8C8C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 11:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mrR0h5a2tnzaiN6M63ThlKTtbHhhDFOkDL005+wWy0=; b=06OVt0AF/UxV5Ps39BJvKuqAng
	l4E3m6yhIbau+Kw5a5ERsKy76fqGauvHoG/S2peK6nPhIAZe+QEESDzzLlXDOlcr8rPRbLHfv5Igj
	6TtVndUI19V+16OvpOjeh15bLXqrACGwdvGUWwoftXf6PkAfpe4iZHlYxW5XaZWEHkYMoA9cED23i
	6hnXnpod78rdDQXfsBl8AGMLkBU9aj9HT+Ngt1cc33z6ygaZmAIB0o6pL/WHu62coFlYUdCXanXGX
	SfgPq+YI91Vd9DzFQNmQVQlfihQFDRudO974PUAyVuDRTV0ZFkA7/JeBXxFE4l0MFWxpCVOevfQ0E
	wzq4YF/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2AS-00000007geb-19am;
	Wed, 29 Jul 2026 11:09:44 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp2AP-00000007gdM-1qbj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 11:09:42 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4957eefd361so5867755e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 04:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785323379; x=1785928179; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1mrR0h5a2tnzaiN6M63ThlKTtbHhhDFOkDL005+wWy0=;
        b=IzuS+iMr+iFGo4+1U3c5v4yjkxJHY+MRfDzBgU5k2T9bNTLO0CBb6adOFznN8QTNUV
         4Xgyg1V+t09hTcLRNgIXA5jIS1g89GStGo6oMiVgpQEqTJ5K5/inI1DvHKPdRiCyDxlG
         ERxFOIRhKvDlws+/IWDbd2ntHqn4sBcPsEu2rGM5qWohoxQAVG9ep5C/380R25rUDZW8
         yAnOrix9eLws3GTANBytjGrQk7BQDk2mzArTJN1hi6SdTCsGGcgrXFt3Wb1ovSxnZhAf
         hwRcQX2Xgt5w1IiEnpgkvr81drqEt3vZY3fyt0oXqzEFNeuHzc+rsJyuX864mYIVYDQm
         4+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785323379; x=1785928179;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mrR0h5a2tnzaiN6M63ThlKTtbHhhDFOkDL005+wWy0=;
        b=Qgn/NpLpDJHblMtXPOLY7a9BeYyS9hFaaZVS1qv/8JT09sCRE7Iuqxo4Z5t0FlT6q+
         OFmF5L18HBDN/hB9ERNGgg2JSOPDBsp05TwnUK3H059hqileou1GoD5PnNsNQwtqyjiS
         S8hmPVUJifaFUWBsQYtFbkBeLIYlGYP7ENO/ciDTN1DO1GHC5UIj87YVqgRlfGwglrNx
         LwH/2BtFCnKYJXtHWfZeFb9C3mct/nE50mJed+6/OusPQVAKhvxL3qCx92vO8IzFgT/V
         Np4A9GbQWhgZT6bO5EzGXaaf7TlldjOCT8wZ7ZxpjrsCmROTobTLixgDjp4/27yeKBuS
         1SUg==
X-Forwarded-Encrypted: i=1; AHgh+RoBQ1x2L+NeFMB6kZRAnRemU/Dd55dpFnZ0Ye8r1spmVY87MEEgvCvx8LbRXaydCOlfCSun0rUnKV0n9W7+IaRA@lists.infradead.org
X-Gm-Message-State: AOJu0YzMJqBg6sJSBsYMneg+8rMng/ZRUe8Tcgwct6Pb23LJiKbkW5Xc
	XrgPxeyQPN9spAOgnOzvRsG3zUnvkuKtzYJnPnsmFs/+5hIeYnUk/NcD9LKNQgn2Bn8=
X-Gm-Gg: AR+sD11SFIoYW/IV03oHVYI9k/zHuqzeleo8pfMMFC+s2Zn1Wjp8Xpb85MwOLyUGdzT
	Mbn4R4TtpNRFrSiPoeZLaFnpl7jyBkYe9NdIwTpThfqty2Jk8TMMRamUAkwyPPtbsqgdX7SBWh7
	ly24Ikd8vXGcTJQOZV+NSD6n+w74djK80bhjm1jvfXs/gNNLIH1YI7LojD8brIDZLsd9QqBowpr
	q/BP2FeWyY5gb61X5KpSMBrA6wANToF0r0TMAQQMawIknRUkK1zPu2saiNxu6MvsEwQ00zHGerm
	5TIZAoP0RQdvJbbfums0+qiemdxOQEdHukm2ZmNDF8CucNx94i7YpsmrGqLS9oPCE12vlcPTADG
	tSTkeS84Qa4rNWNujL5zDs2XOc0mFoGVt/FIdkgsu/lCQ0jarM7i0wChYjXQw+KxA5Hits+3MHX
	TkR6nt5h41ikw99xuF7Bx2CrvEQUa358Wm+xzivAdCubzqJINWJ3v7Kc4MUEoeJeo=
X-Received: by 2002:a05:600c:3b13:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-496c653d3dcmr82110535e9.7.1785323378759;
        Wed, 29 Jul 2026 04:09:38 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4976bd7c4c2sm50189635e9.14.2026.07.29.04.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:09:38 -0700 (PDT)
Date: Wed, 29 Jul 2026 13:09:36 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com>,
	'Karl Mehltretter' <kmehltretter@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rt-devel@lists.linux.dev" <linux-rt-devel@lists.linux.dev>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Clark Williams <clrkwllms@kernel.org>
Subject: Re: [PATCH v2 2/2] serial: amba-pl011: keep console clock enabled
 for atomic writes
Message-ID: <amnfcOod6ayqfNda@pathway.suse.cz>
References: <20260724213348.77418-1-kmehltretter@gmail.com>
 <20260724213348.77418-3-kmehltretter@gmail.com>
 <TYXPR01MB15199DA567AF4541DD79359FBD7CC2@TYXPR01MB15199.jpnprd01.prod.outlook.com>
 <87pl0863t5.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pl0863t5.fsf@jogness.linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_040941_497990_902C15F0 
X-CRM114-Status: GOOD (  22.54  )
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

On Mon 2026-07-27 14:05:50, John Ogness wrote:
> Hi Toshiyuki,
> 
> On 2026-07-27, "Toshiyuki Sato (Fujitsu)" <fj6611ie@fujitsu.com> wrote:
> > Regarding Petr's comment [1] as well, I'm concerned about the
> > potential impact when the clk remains enabled during periods without
> > console output.
> 
> Can you elaborate on your concerns? Do you actually need such low-power
> _and_ kernel logging directly on serial?

Good point!

> > When creating nbcon patch, I saw a similar patch [2] from the past.
> > Have you considered coordinating with the clk subsystem implementation
> > for this?
> 
> AFAICT there was no real justification for enabling clocks per write
> other than because we can. A lot has changed since 2013 and neither
> spin_locks nor raw_spin_locks are appropriate because atomic printing
> can occur in _any_ context (including NMI's).
> 
> If the amba-pl011 insists on enabling clocks per write, I would
> recommend not implementing the write_atomic() callback. Since I assume a
> significant amount of users _will_ want atomic printing support, perhaps
> you can add a Kconfig to toggle building with clock-disabling and no
> atomic, or clock-always-on and atomic.
> 
> Note that there is also CON_NBCON_ATOMIC_UNSAFE available, if the driver
> wants to somehow blindly enable clocks on panic in order to unsafely
> dump panic logs.

I personally vote for removing the enable_clock()/disable_clock()
from the console->write_*() callbacks. It was an interesting power
optimization. But I believe that the chance to see kernel messages
in critical situations is more important.

Also I guess that the serial port is _not_ used on devices powered
by baterry in production. It might be used when debugging and
it is exatly the situation where the messages are important.

Best Regards,
Petr

> John Ogness
> 
> > [1] https://lore.kernel.org/all/al4KdsU9YLOmwDoV@pathway.suse.cz/
> > [2] https://lore.kernel.org/all/1359475526-17523-1-git-send-email-walimisdev@gmail.com/

