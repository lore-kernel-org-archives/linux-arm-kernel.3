Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8293CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 08:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2UfVrtQtDdLvg2QvC6NkvEB9QpKNZIi46PhakH6CwPs=; b=wQgdF74y6VCeAvnOe4tsLuJI0Y
	MvfVOoANRrt9n5wAZ1arF83eCGvZTg1mtYlq5xEed7edy45AiMo71g/NwfZC/+oVxejTjhzFjJt2l
	kHpV/x1W0f1HcrJzoaNsfSgmo5B5D78IQF3gi6MtAcSE5Tz1U5e2CPWqsSASVpW3aItoIxPqed6YV
	jJvDRwJSjcKw2A9l3IboSt/EtaU/ZADYjQ3OxQgTWeqqvT0QIAj5SK703wzVCoLz40MNtSHnbcoOf
	A96J8VJFAyIIRWEwuuxGmb62c9w3fD7bVICrg+1N2OHA7h17glnQv/xMIOkdlndkEYxSFCIlClif0
	JD/mLlYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHa4-0000000EYDL-2EZb;
	Sun, 04 Oct 2026 08:28:24 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHa0-0000000EYCy-33aA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 08:28:21 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5bcb657c504so698481e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 01:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791102498; cv=none;
        d=google.com; s=arc-20260327;
        b=jp8xQy4wlCjq41SwU7a2ZNcw8nBlCAx/7ecNlPZB1RjULbX/LpzRWal+YzSUH2Tm2k
         HmjZ/bzluuj9wjjOaz+rwKYLekQNiIcfocjttvl1X0wA6eIlp5oFz2WLuDtrVfKR9BcC
         J3JhHNxGU0ODIrHN+DzICNnauUDehzgfqTKpKXn23TDzIrsKZ8/xOiESQ5vuKJdhWDz6
         eeZLGPbYfg6FHlgZ/MOTiE9lj2aoWwkO5ybvt3VBbgS8kDfUswlaa4xFHbnD3EKOKzwi
         wAKRccRF4FJ2rtXFTiz3M/11kYLOcve8X06wSvpBx1BmG4wDsOidkHGIoDg2OwrmxnSL
         EWHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2UfVrtQtDdLvg2QvC6NkvEB9QpKNZIi46PhakH6CwPs=;
        fh=3ejaF+r1ZjRSGI+TS8c+JLBSWQzMBr/OulSARYaYHAc=;
        b=sKABMq93kpS33qmxUGCBCjDGpqwBR7ER+2uYKGTmoSvlJI9cKRa2lZ/PmL3d8IoTSM
         O1hi/PK9dD4AkahidQooLf78OarZw4x7nNVKLFiRWAubn1mAtLRDOrqrFROw7q5EDNdq
         d4VQeJOOLWpuksgpt6dCxXUGVgGbi9OHE1fA+crZ4Ro9TJCuoYpZ3vaWTMTQt/bbHD1w
         DZWHNQBK9AgILom2n6/fcTf6v9lZo4Iim2L0b6Ok0TiVdkfIJxqTtfDAd2zTTvd8FlLX
         StzIRpb/+1WYn5j6jjmtE4lOFIvYID0PpJ5GLMBxM8jvl38dCuihkxrxN4wdvEZweCP1
         p3QA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791102498; x=1791707298; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2UfVrtQtDdLvg2QvC6NkvEB9QpKNZIi46PhakH6CwPs=;
        b=Vvalmidi1SaUs9NVj/JSiH9EkNEyJTKdXP3//6BnhtxQ7T/ZvgCNSgI85LThiKaol2
         BUZlgwxQXaohULGJOpYDe+SS8IXsaP9VtENFZXzh6Sl266um2Z+4tb8fmreWFPNDz8Eu
         EEMnkmKsExvFW6Tuzd9dWpAIbd8lSIkvbio8+ILC5vbmCJIumyPB3xevZ5J2EcLE2AP2
         HzxS1pyacuW4dKZoWPWfMLSU679sZIdwy0k3KGEytwa86eY6rbHNe7wXg6fhgxz1o7sW
         ujMe4OFSsj+CDCrzfz7GGkdS5RexJ2+duY/j70IRu7UZDR6L2Bu6TcBHSwUlZUMYTb9M
         Vf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791102498; x=1791707298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2UfVrtQtDdLvg2QvC6NkvEB9QpKNZIi46PhakH6CwPs=;
        b=tQfN6yZJzxT1HhGPCh55UrlQtrK6InCnIKXz56oE82JuME87UQ2W1SE5OM7ck8ySaQ
         By0GZ/rhYMRiMCVdG3C4Z1Oilhp6QzP9wL5QSNJJSNhwhk38wAzop0uWud10xmzWcV3x
         vTd0XUzP/aZF8yu6/utjT3bTi46+j+0TYgxhqyYTpetgyH8PIjtE0QbSWu8IHv2UjI8l
         SKMoa/BpX/A1l6Z/7rUscTC03RPZNM5w45IQZhl5kKaNSRewMQTd6Wa+HoJIpgLJ1iCL
         HURSO8vE1JU6CBNuI95yOUT9h3AQpDZCaKmD7/Q5hvwg14H1FnCFz8mmvV4hbK0vzib6
         n9Aw==
X-Forwarded-Encrypted: i=1; AKwUvBxnGbPNI8rLjH5cVpVrFBjmgNHURVLCXsTTJ7m1RoJIG2D+hxfhKr8VNOOYFUELS0UwpDif1ZYKkNz4mS5WEFJi@lists.infradead.org
X-Gm-Message-State: AFq9FYKZAcH3yMrafgygS2MRsFMpsNE1g5YihAdXqRpkrGU8pjGfMQkL
	xVjxKzsffT8QTKneHRIAoli4JiXBCWB9nchVb+lAXYCRsyvkWDRxgtXLjP7XEJBuwkI2rS364HE
	xlhhOnKbon5hu6byJrMcILz0XCBrBb7K+7AAeTfc=
X-Gm-Gg: AYBFou2RlgcXFGgEdaykQUYzXAORJXllLtlXoEVr8k4xS7B4SWsZmQQO5MBbeUcp1Fv
	FzbXyKmAvj1L7MhMLzmddm72uAShzKW4rBAtEJtWVoCbQevwFKVlCQjzxoW8UBNsh3nJojXlk8a
	Ncw40/9bm4T6BR3+i8Iw3IoyvDPT5bw9I9x5bNh4XqhbCgPWuUZywG+om2uj+nfbotV3riHSu6O
	nSliljKsng+0jF96fqIW6MBezMgHjQC8d66aXGD/tuBZUcgLi2biQeRI9bp17Cd3CQdb8wqUJ3X
	MZCtwijO+boZiPslUlhLFL/smFjgqiTFGOZbN5v7cbGC1JqJsEpePQ==
X-Received: by 2002:a05:6512:3b24:b0:5b8:ed29:c716 with SMTP id
 2adb3069b0e04-5bcb54880f5mr1712748e87.54.1791102498104; Sun, 04 Oct 2026
 01:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20261004065930.1004953-1-maimon.sagi@gmail.com> <179109746015.1402591.14131579685594488279@kernel.org>
In-Reply-To: <179109746015.1402591.14131579685594488279@kernel.org>
From: Sagi Maimon <maimon.sagi@gmail.com>
Date: Sun, 4 Oct 2026 11:27:51 +0300
X-Gm-Features: AclHuK94JJK7lpEO1Rvw-VTUrCkV0lBc8k2gs9LxPK6XjrE-JxVbKtZnZ_NtyW4
Message-ID: <CAMuE1bFcB73iDAogQQKrSmj9vUvfcV9x-HahvQDXiMxq_d_4rw@mail.gmail.com>
Subject: Re: [PATCH net v5] net: axienet: do not report TX completions as NAPI work
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	suraj.gupta2@amd.com, radhey.shyam.pandey@amd.com, michal.simek@amd.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	robert.hancock@calian.com, sean.anderson@linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_012820_820535_65D00F44 
X-CRM114-Status: GOOD (  20.34  )
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

On Sun, Oct 4, 2026 at 10:04=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>

> - What hardware the change was tested on. For driver fixes please
>   mention the device (and if relevant firmware version) used for
>   testing, or say that the change was not tested on real hardware.

v5 has not been tested on real hardware; it is build-tested only.

Earlier versions of this fix were tested on the AXI Ethernet MAC (with
the built-in AXI DMA) of an ADVA TimeCard X2, a PCIe card, which is
where the "exceeding its budget" message quoted in the commit message
was seen.  v5 follows the pattern of commit a58cdf56b6eb in bcmgenet,
as suggested in the review of v4.

Sagi
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

