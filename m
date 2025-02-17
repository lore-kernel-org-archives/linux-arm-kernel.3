Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D13C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2sPfQZeay/1JXMe5RGbQaAOhB59g6LOSfQU+7lUlqI=; b=fDjnpm2Wd/xKKwFvo9i0gzSqE7
	fw38IgZD+rBaml+6p17KDb7Gd8MCee2MMToFogiykHjdLep2LYKakuKuj23H/oyLFtcNk3ejrk/oa
	4Z18OFofV6BP3z4eXvPGLYV2fGWhfnzbQfPYp1WRK5e9gVca/v/quM/3s32GCOCV0W8SzKFW0X/+Y
	1Cs6RfnW3vA4a5oiyHF8TGOIOUEIvlpZV+Jhq98Snnla3zrLKnjUkfbYbIQZtHN7OyKaOj+uXg6Wm
	vnqCPJfxIUsz8A1xDUnr0kX/nK5lh4XUN8SZcWufm/f4UeduLCyZ7Smvrdcc5APQW6ull+xN9yU0b
	2Ur7/c8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2c8-00000004yHK-0VXn;
	Mon, 17 Feb 2025 15:00:52 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2SZ-00000004vq4-2b7f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:51:01 +0000
Date: Mon, 17 Feb 2025 15:50:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739803857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A2sPfQZeay/1JXMe5RGbQaAOhB59g6LOSfQU+7lUlqI=;
	b=LdMNlwDC5lDIT/Jpq8cLWTPbvimW/JscZDQRx4CxlRBjyO/RfxVBHBovmcfvwei48Zi1n4
	Cki8D6+FtvFxa/l2hwUfJIeiW9Fh2wh2RP4Ah3o6l7kopWo0ckWjdk6SVWIxIUJ6HCoWec
	s5l693cp41fYWV4fI/PLXR6TB+h4qOtcNHBke+frCLq1zfwihx3sUbECsKI6AGfMQ30o2V
	V+lccjqrKjEX3cdPDFWlRv2Wi4eJNIbfJrKDUmls/OiSqt58ETNVf68E8trM88QMtzn250
	PRaw0wJCra+Ud+xcquDBmLSyBnbCqWIZKQJKZ4pz0l0yEADzlphijA+ZCJAv5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739803857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A2sPfQZeay/1JXMe5RGbQaAOhB59g6LOSfQU+7lUlqI=;
	b=S2jI3v4/Olq9v83ieKDobcjhEdUL3f81KbO/RhkmrGvI44BHA4HRqSEHES+BQP4DOv0T87
	AKFQxN+/p89+35Bg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] usb: core: Don't use %pK through printk
Message-ID: <20250217153444-4e1fd8ec-7f0e-4f40-8fc1-e323e4622284@linutronix.de>
References: <20250217-restricted-pointers-usb-v1-0-78da55158832@linutronix.de>
 <20250217-restricted-pointers-usb-v1-1-78da55158832@linutronix.de>
 <2025021733-strudel-curator-bfaf@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025021733-strudel-curator-bfaf@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_065059_795162_918542CF 
X-CRM114-Status: GOOD (  12.82  )
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

On Mon, Feb 17, 2025 at 02:52:05PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Feb 17, 2025 at 02:20:51PM +0100, Thomas Weiﬂschuh wrote:
> > Restricted pointers ("%pK") are not meant to be used through printk().
> > It can unintentionally expose security sensitive, raw pointer values.
> > 
> > Use regular pointer formatting instead.
> > 
> > Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> 
> So really this is just a revert of 2f964780c03b ("USB: core: replace %p
> with %pK"), right?

In this case, yes.

> Why not express it that way, and explain _why_ it's somehow now ok to
> use %p when previously it wasn't?

The full background is in the email linked from the commit message.
%p is more secure than %pK since
commit ad67b74d2469 ("printk: hash addresses printed with %p").
%pK was never intended to be used through printk() in the first place.

I'm doing the these changes for various subsystems using a common
commit message. The changes are not reverts for all of them and
digging out the specific history for each single line is a bunch
of extra work.
If you want more historical context, I'll resend the series, though.


Thomas

