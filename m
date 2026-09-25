Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0C3C9831E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 00:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/1axvX4nN0CV5MjaicWKNBMunNziYiH3mIqVnl5Qs4=; b=u4uRUTb5ldcvGw5kaXb91T8rbH
	Rtz8Adx8v1zkujn3AEdkKZY4sJA63vgUYfHemKjnWrO18uqY/iKmL2mzCYxFb0KQyuWeVsB/FD/pp
	EkUlVV5/bOEql1VxSfaHRZSW7DSRTbaBU1rTlzpAVXmYL2W85LBiGViqxu4fI30jvF+s/aODhVrxv
	jRxZbxDSeTRa8vccuFScMPAMurpRbGBOEy/2x7R++cGmmoGOYwlMpICQeH+RsehiD5GW8gnceVyx0
	LNppoNOJnVoEEYtImMB0OhAMv8Fs13Mtmt+1xq+WAt6vcjswhBKHBm03wEDpJCIv/YKwUIYuLs8sW
	hLHTripA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tV4-0000000CRB4-48K1;
	Fri, 25 Sep 2026 00:09:14 +0000
Received: from mail-dy2-x19.google.com ([2607:f8b0:4864:36::19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9tV2-0000000CRAf-2XG1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 00:09:14 +0000
Received: by mail-dy2-x19.google.com with SMTP id 5a478bee46e88-33e46a156f4so151334eec.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 17:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790294951; x=1790899751; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x/1axvX4nN0CV5MjaicWKNBMunNziYiH3mIqVnl5Qs4=;
        b=RXQy1Bg0BmFi5PCG0VscOGEInjLwFKvz7LOgN6coh5yJ5XEnKPcjfmYnqESItTfLTf
         LAa0Sz7EVRXCoUvjGd4qQdz41/a4cntoq0MY+ddIlEGPggWzdOKKeYijf97zWhlSYWHE
         n3WhpmpxOSDY7J8nP2lOG+2xK5pqzVqiu4rAbSkLckmmdfvlGBng/87eV2W0Yr1uQceJ
         ssFJBlEiUciMqnB5M4wC7o67Zp43R0KUxTRlD2+w6ClzZT5QFpN6M2CfzFnuL5oSMi3S
         o3ae0f4pZkzG9ETf+ccDzmwIBDFR6jDYGiRWT6iTlEKyz/a0DCSXGv9S8+mVXq8mrD3R
         OrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790294951; x=1790899751;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/1axvX4nN0CV5MjaicWKNBMunNziYiH3mIqVnl5Qs4=;
        b=lxKCeI7Q0FtXv2LTFYD2BQ/Sy8SCHmSK6M7phupe0q7m4JaimXxRIWrBTPFxhlgQ/n
         NDNffN/iZkIhITiW+Kd39tVMyH8lv2LQF7p7qS/K7Nh6Jp0mCRFn9vsCYSFCvkQKGsUC
         aIqFcF79Fqm1GbV3cjrL3sMVPBaSGPB6oZc249trobwWeQnclWIT6uDr2pwcTevxHg2c
         fL4wo+/d4MpsaHqHnjTTZ5W5+F4L15P3IpJKhNWR/FPjWNh6KFEh9pio6oDGmr7O9yGz
         NylT42ur45bp4IkSj5qcNdYwKCMpW0Hftsr7tuZv/SLaE0SNkLeAovEwytG+CODPnhsA
         e8TQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNHLnd8g/m0SmU7i0LAKcQVXIOpHBlHefN8Nl9EQOlCmitc3asGGQw7TAv+9d0YXV9jrnNs3lUE4wtVbtahMBp@lists.infradead.org
X-Gm-Message-State: AFuF++mp21PMPA729nqCVhHyea4RUcziXrKzQrqGFN/noO80ctEonOLx
	7bTWOVuXqfi38zRgBoqAiwWzuvea2g0vPk5OvpmRhe6yUwTo57pkZeubb2H00WX74uY=
X-Gm-Gg: AYBFou0Xi/uxr08nVaiDHOxuqV1jbYB9iAuq1LM6poWBiBlifX9VzM8MhwURqW0Z94B
	4aXRVJ6L0fC+7w7/m+AWHAfr7Ifw4IUh5reIa4Aa1XU46+nVXPYkM+Yd745+zNWf0BJMzw3srqv
	6FHGclNl+xVdr8HhzYN+HbVsshziz+yiYkaPmWxcx7wHXAXX7BSjC+AYb0GeH9NyAevemXs1bhq
	gDO/U+zhAA0VjIJ2yy7FQecJfdg2mdMqAA5IfTb8KjeciMFcP4uD+H6acSnnm/H3hImE6rh8ocl
	Rwr9WOrh5+jCYuDbwG2On4Cw40k0rstkTpsBNKksHEn7FZXBTqoD7x3aqSrYwvP1EOAxpaVQI2q
	Ls8KDxRoo7tto2Qv6qhrLZ+60oazAxvUHmQ8/cQa1c6bc8fb8qD5pnVpGKoBnAMP2mhgzav6TmD
	SKKWq/pIm6HOpWgSrbzPgaFtqVpwYcAnXclfgc2Bw/rvlQFWvxUIi5drOc71SsGXR0NiGdLwM=
X-Received: by 2002:a05:7300:8aa3:b0:340:f935:5fa with SMTP id 5a478bee46e88-340f9350b79mr1651254eec.40.1790294951369;
        Thu, 24 Sep 2026 17:09:11 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341463ec3ecsm1874059eec.31.2026.09.24.17.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 17:09:10 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 17:09:10 -0700
Message-Id: <DLNYLDZ4WO92.16A9I7PRTH3WL@nexthop.ai>
Subject: Re: [PATCH v6 1/3] i2c: xiic: preserve PEC byte length in SMBus
 block read setup
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andi Shyti" <andi.shyti@kernel.org>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, "Raviteja Narayanam"
 <raviteja.narayanam@xilinx.com>, "Wolfram Sang" <wsa@kernel.org>,
 "Manikanta Guntupalli" <manikanta.guntupalli@amd.com>, "Shubhrajyoti Datta"
 <shubhrajyoti.datta@amd.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260923-i2c-xiic-v6-0-3a15b6397f5a@nexthop.ai>
 <20260923-i2c-xiic-v6-1-3a15b6397f5a@nexthop.ai>
 <arWC6PFh3YVgU1Pd@zenone.zhora.eu>
In-Reply-To: <arWC6PFh3YVgU1Pd@zenone.zhora.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_170912_684787_66BEF0DF 
X-CRM114-Status: GOOD (  16.57  )
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

Hi Andi,

On Thu Sep 24, 2026 at 1:09 PM PDT, Andi Shyti wrote:
> what if rxmsg is 1? Before this could never happen because we
> were checking for rxmsg_len =3D=3D 0 or 1 and we were ending up here
> for values greater than 1.
>
> In patch 2 you fix things, but we don't want to have dependencies
> between patches.
>

Confirmed. The widened condition makes the else branch reachable with
rxmsg_len < 2, where rfd_set =3D rxmsg_len - 2 wraps the u8. Traced on
hardware against a zero-length block read, sweeping pec_len:

  pec_len:             0    1     2      3
  v6 patch 1 rfd_set:  0    0    254    254
  v7 patch 1 rfd_set:  0    0     0      1

It doesn't actually hang on my boards -- 254 lands in the 4-bit RFD
field as 14, and both slaves I have keep clocking past the end of the
block, so the FIFO still reaches 15. The programmed value is wrong
regardless.

Restoring the old "(rxmsg_len =3D=3D 1) || (rxmsg_len =3D=3D 0)" isn't righ=
t
either: pec_len isn't limited to 0 or 1, because i2c-dev sets msg->len
from caller-supplied buf[0]. At rxmsg_len =3D=3D 1, pec_len =3D=3D 2 the pa=
dded
branch would record smbus_actual_len =3D 4 while draining only 3.

So v7 moves the bounds into patch 1, where the arithmetic is introduced:

  - the guard becomes (rxmsg_len + pec_len > IIC_RX_FIFO_DEPTH), which
    is what keeps rfd_set inside the 4-bit field;
  - the else branch becomes rfd_set =3D rxmsg_len + pec_len - 2, identical
    to the old expression at pec_len =3D=3D 0 and unable to underflow, sinc=
e
    the padded branch already takes everything below MIN_LEN total.

Patch 2 is then just - 2 to - 1. Resulting tree is identical to v6.

I also finally exercised the atomic trim you asked for in v5, by routing
transfers through xiic_xfer_atomic: it fires, and block lengths 0 to 32
read back correctly on that path.

Two notes from the per-patch run. Unpatched, pmbus_core creates no mfr_*
files for these devices and every PEC block read returns -EIO; with the
series they read correctly. But patch 1 alone isn't observable
end-to-end (patch 3's -EIO masks it), and patch 2 changes nothing I can
measure on my two slaves -- its bug needs one that NACKs promptly rather
than streaming.

While I have your attention: the other xiic patch, "i2c: xiic: restore
non-managed runtime PM to fix clk WARN flood", is still unapplied. Andy
acked it on 10 Sep and the review comment it had is closed. It fixes a
regression from my own 50c63491ff26, which is in both v7.1 and v7.2, so
7.3-rcX would be a good target if it looks right to you.

  https://patch.msgid.link/20260821-i2c-xiic-restore-runtime-pm-teardown-v7=
-1-954e06765144@nexthop.ai

Unrelated, for later: smbus_block_read is only cleared in the BNB
handler, which the atomic path never reaches.

Abdurrahman


