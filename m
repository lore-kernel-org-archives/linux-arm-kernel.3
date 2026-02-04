Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11944E9538A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 11:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pzk9ekf+w5m7EprZs0DpKyLz/hJhYQ3DquAy3S2RPkE=; b=sI+gXUcKhQwzwir7+bqKKbiA8y
	MI0EyE9MdtfCp2lnZ7UEm/UUhyDvuCFTXL4XslRXw4F2sm0DYNYxmy3my9f5nsJeQrF6fMpREJcfz
	PLJ2zGQUOUAzYqScGYcTlqS7tCaVc4pL608kBC47bIEDXOLbjEFTumWXFhDbGtSOrAU+xNVhfPFNv
	2WNMJb8ckSaNETqop+KFIJtkk3UQQ84j7oDKdYE/lQoM8dV/dvRq7AMgpEESweHDZvW7F9aEvtYhq
	aSClVV4aWNgYeGfsjPyPVNlDrTX1sPr3wk5WLp+IRyO1OBBhn3NdMnj/O3Y0kae5VMMQGd4/AhHBP
	m3NFlElg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbFT-00000008NbP-05dv;
	Wed, 04 Feb 2026 11:40:43 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnbFQ-00000008Nae-0ymT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 11:40:41 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-59b76844f89so6381475e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 03:40:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770205237; cv=none;
        d=google.com; s=arc-20240605;
        b=BFWjagRCW9a0pXkv6QmgQoQ3uWass7uYKZ2/BqoVJhF1V9cK13E6ZFrVEbk+FrbpJ9
         CrJ4zD3jMtSMkFjZsCil8qeCa/sqT/0WQIz+tC4Vui/I2RMUONEOiEQ76eAs3rXiod7f
         VRDbEfw80r/HoOzNSYPQp6EWd9TzhkY9wYsREshdGuDVHz1u7M7O44HjyPatdsQsBopG
         soFcbq1KTSfwOWSHVfmvh7clVyCfPdivtzwCQEqBgPWrkGbw0s5R/6sZHK226HPgNair
         1n+EJukmq2n1DwLBbL7yYyAKedLHrUQEAno9UwVzk9E202KBFJ2VR5to9LAPq0drT82Q
         gilw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Pzk9ekf+w5m7EprZs0DpKyLz/hJhYQ3DquAy3S2RPkE=;
        fh=hO4/FyL7N24LkBN3Fu3KEtBjIpbrWatPA5Pw23Z+CJA=;
        b=LOWkq9NUFwphn9ERfUJsLTOW3x+Ow/jKIAo9xj0qgCODlkoHPdw3KopjGwKMQQvn3Z
         H0eogR3PgtMBTueQ2DC3PXwVD5msCZ7pZCrmqKBXW8ntBStXGTsqGCqVohtgypZYMVNn
         eG1bTbcTm80TRylnwLlSheXIefFXZVKcn1f8SckOgBKAs48qVN9LoviNlldvkPVXHUlL
         T0PeeNxyobO0OZ1wZBX/XvCcnLGZjoow9qWj2uvo/9r98rcUwxxUZ133h0bqh9hqeSri
         hru4ZxW1faaEqa4Dk2M66DlKv04Fr7VGMhd2TCZ2EJianmcvWUNQm82gCApuJxI+D1aC
         jwqA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770205237; x=1770810037; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pzk9ekf+w5m7EprZs0DpKyLz/hJhYQ3DquAy3S2RPkE=;
        b=Yus3zqKnf8evz3RRivco3hlCK1VzAn5Tf2fSB2RTOyyxGWi2zM2WxgCSjwg+qbuS4V
         Lu3xTt1HfsKpL1KhjTDWTPTQ/eFvx5Pp7CbvN64Ohbe5VnL+HfzG4hVra4Ze8TNdXo5a
         CZ/khyxb64/Mc/E/kwxXzVSC+vXoaai53Kj55eh1/PvFVui/aejUj21uBujGyYyVkG7l
         FVySct/fSPkIepi05Tc7m2Dta7WpJO538Y0qB4eveoM7MSfsWqyOn1qsc5mHPI9Tlq3z
         4rsL+tfLrfYOHwWerqNG2A3o+jOyCFdFwt+txbWQae++aTpr+HmlRkNFHbgD2UoGNIlW
         lUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770205237; x=1770810037;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pzk9ekf+w5m7EprZs0DpKyLz/hJhYQ3DquAy3S2RPkE=;
        b=nnOBp4xd58uMSGWC6gErtpwXG7mFSqiAgAS5J4G0VtalK09WohBZmu2ja11rXHlYW/
         i4AKJQPjQ1Od/m+r1F8nJZS6O/NO48Wp+IzX6N85j0OKek6+1kmg6g/5Mn2ei3MOjyw8
         DMvhS8MAvE4Tx9lhaaVNlRrcpCgptiZoC6I1Xb7NtQK4VkeqNd10VrUlM2LRM4Lex7hp
         /BkiU6D4bZpk06Qj/2xx69h9SgKlBhr7nTUyJx4bAZxFkTm22l97QeTOb2MmSC0tA/QB
         S438sZ1+G8tKOes4w/5TNqC9AFszC9mbx+yw96tJaOEp7efAwwlNgQjMg8EFIS5lKDLe
         xP8A==
X-Forwarded-Encrypted: i=1; AJvYcCVhuaX1H9pFTxj+cXw9XJwdtvmhnPM1C6Z3jjMaMv5gZxFkBFOOnC+CiRQuFOLEO3UO4dqqA5R/RsZZc6914LW0@lists.infradead.org
X-Gm-Message-State: AOJu0YwNbxaNkx4u/aDv3hwWQKCSZE0G0TeLa6GvEPPi3sQaXud/j2/H
	sLIRjvpxrg+XH3lWhe2Oka7dqv7vCSxywC4i94M8J3tRvsmwkusS7Sdj0992ubFTsUlLXNON7GK
	X/rYu/KKeM1scxhtQimamB6IW+0qeLFTGpG/hZIArSA==
X-Gm-Gg: AZuq6aJLc3S3uYcsP9sGR50a9SIeHiUL4PYwzBgJJ4Gwr+La4wYeXHLDVCg2pQtKoTb
	RmaaK+2UFEyaUg/QBC+vrw5T2mu+Zj7PXOY0lsPyfTk7eR4IjeKyHJVIUEtXYxDb/Uh4KVZM9YJ
	wHNtdJXxXFq4tveX22huNGb0UxvjBwXdwRPB0T/VNHM5fQ4ZO+xa3DzDjKyFSxp8idUyNww1lBJ
	9Ye0RytdCSBeRxTNxnLIZpQZxQOGFjn52eNONOUF5wUI0dgSLXxd+d8MeiJIICM0FQcs4kZ6gMJ
	k2Q4bJg=
X-Received: by 2002:a05:6512:1085:b0:59e:14f:a4d7 with SMTP id
 2adb3069b0e04-59e38c2d748mr1017297e87.27.1770205237316; Wed, 04 Feb 2026
 03:40:37 -0800 (PST)
MIME-Version: 1.0
References: <20260202074730.738760-1-xu.yang_2@nxp.com> <CAPDyKFpqfo1R8Qkq284L9DTURjZnvm_n8W3a6KQTomg7A-M_Ug@mail.gmail.com>
 <lh3cb2r3qvv2ar76ai33fjiuseqyiwoks2zjrmowknvut4qfcg@2db76miyk4wn>
In-Reply-To: <lh3cb2r3qvv2ar76ai33fjiuseqyiwoks2zjrmowknvut4qfcg@2db76miyk4wn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 4 Feb 2026 12:40:01 +0100
X-Gm-Features: AZwV_QiX5AkXx_w9Zse93HKg4-tfhffXTYB6o8jqYrd0yS7lV2JQJGMo75ani6o
Message-ID: <CAPDyKFpFfhMTtAp63cjB2eVR78mbhBEzzSBr1Zxk-14YT448Lw@mail.gmail.com>
Subject: Re: [PATCH 1/2] pmdomain: imx8mp-blk-ctrl: set awake path for
 power_dev if attached device needs wakeup
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, peng.fan@nxp.com, jun.li@nxp.com, 
	rafael.j.wysocki@intel.com, a.fatoum@pengutronix.de, ping.bai@nxp.com, 
	shawnguo@kernel.org, l.stach@pengutronix.de, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_034040_323146_10066921 
X-CRM114-Status: GOOD (  31.80  )
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

On Wed, 4 Feb 2026 at 09:48, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> On Tue, Feb 03, 2026 at 12:06:28PM +0100, Ulf Hansson wrote:
> > On Mon, 2 Feb 2026 at 08:46, Xu Yang <xu.yang_2@nxp.com> wrote:
> > > +
> > > +               list_for_each_entry(pdd, &domain->genpd.dev_list, list_node) {
> > > +                       if (device_awake_path(pdd->dev)) {
> > > +                               device_set_awake_path(domain->power_dev);
> > > +                               break;
> > > +                       }
> > > +               }
> >
> > This is really messy in my opinion. Ideally the above should not be
> > used by a genpd provider as it's internal data structures are managed
> > by genpd itself.
> >
> > If I understand correctly, this problem boils down to the fact that we
> > should have tried harder to model child/parent domains, rather than
> > using runtime PM to manage the parent domains. I understand there are
> > problems with that, due to specific power on/off sequences we have for
> > imx power-domains, but I wonder if those could be managed better by
> > using genpd on/off notifiers?
>
> Indeed. I have tried using subdomain will resolve the wakeup issue because
> the parent domain will manage the child domain. But I shouldn't use
> subdomain and runtime PM way together to avoid any unexpected behaviors
> according to my understanding.

Well, there is nothing wrong with using child/parent domain in
combination with runtime PM.

Although in general using runtime PM to manage parents domains from
child domains, should be better managed by genpd itself.

>
> >
> > Anyway, that said. Rather than walking through the list of devices as
> > above, I suggest that you use the ->power_off() callback for the
> > corresponding genpd(s) to dev in combination with a genpd power on/off
> > notifier for the corresponding genpd that the power_dev is attached
> > to.
> >
> > More precisely, if the "child domain(s)" that corresponds to "dev" has
> > not been powered-off (because device_awake_path() is set for some
> > device) during system suspend, the power-off notifier should return
> > NOTIFY_BAD to prevent the "parent domain" that corresponds to
> > power_dev from being powered-off.
> >
> > Would that work, you think?
>
> Thank you for the suggestion. It works for me.

Great!

>
> With this way the rejected count is increasing. Does this have any impact?
> The count is just used for statistics, right?

Yes, it's used for statistics.

>
> # cat /sys/kernel/debug/pm_genpd/usb-otg2/idle_states
> State          Time Spent(ms) Usage      Rejected   Above      Below
> S0             1203           0          1          0          0
>
> Thanks,
> Xu Yang

Kind regards
Uffe

