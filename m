Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 416F8C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 04:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbE1vu8p57+mDxFNsPodzCeB4DHzKs8bR2Bh8D54hrw=; b=to9opGz7r/mjyZpufATLioWji1
	+7iGVWZOz+RMMMC85D/HhqqFAcJrKn0rgg5pjnDXyuOLzKI8peU+lOirNgxxCAoWdvuk7nrzzPI0+
	hgA+qxgCxT/eW7VsNknKH+6gDsT6pwLYB5VowEX9KH65E3Vd0qncAS7lbC7EeSvtQKezyZcJTag6Z
	6XfRGnE74eKLLgnsRHCGYGr1shMDrHl/XoPtpZufk6mBtp4t5Dx4wBa7qyUuYTyNl6BXoAylT94zx
	eUr+d+P2cOPDgv5/zKCGpOgGbvN8ntPKCWgSSXFV6fIpGdIZyM+jvQUFMgi9d/WBC+T9EmH0y2C5z
	B/uIBwvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2Z8-00000008P9u-3fAq;
	Tue, 21 Jul 2026 04:58:50 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm2Z4-00000008P8q-3dzl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 04:58:48 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-ca913a601fbso7329769a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 21:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784609925; x=1785214725; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wbE1vu8p57+mDxFNsPodzCeB4DHzKs8bR2Bh8D54hrw=;
        b=kWnu8a3Ya2btVTv3cBgAhwCOP49GsNFAWGryvTVkOhQGUgej/HDpeXkTT5Hqxwzhk8
         iorduNZQSK6v5oKr0tXEcIVaGoneiKDSJa+fz4uzYSfvnPfygbDjpnTvwKKO9QaUFcCl
         a1MTxee/EU/npk5HmfYUT1A5Ndw4cSjrbvk4YaIn8oeWI3aYRmkydjZ89clGWMiGBQVn
         tnHcJRACIae9fVPMj+1fyaC76RoDa+OiP51SY4A0zmRE/Wf/6q1/Yn/LPjg7Hs8uCuq8
         mHxypOd1KVZLj+PaYO17Eyfd4XsFHW4LkaY1Hi4jjlR14B/jcAymSYn+2ytnwbdJPSBD
         RIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609925; x=1785214725;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbE1vu8p57+mDxFNsPodzCeB4DHzKs8bR2Bh8D54hrw=;
        b=pQeGvewdg/eMTNHp0KiKLD97aZeDvRJRd5dWCx0VKoK+PKj58/ue2qIQEf1GfLGvtV
         10WoXJJTGQMdGJ695/mI4BwSxpkjlt+G1JRf910F+yPq4uNk8z0sAKqV+/fOKRWJXSmo
         24s005FQklzEEdSq7ZQoHWT6kVTeg0Vlqx1TQXo1nLiOHKLjjle1s1awbYGBPjVjhMS3
         sFgNhf+35GFSBlHC8wPCJhBKd50hxjP7qCGS0cBkYfFlhC+hAfZcqPV/+0/MmFTcd/G2
         7y724B6ZcIzpmGcXAdqHzDf9i4OY0ID3Z8OCuL3WPphyY1iiPjVyfFJ1HrH5MrhMuJkb
         gBXw==
X-Forwarded-Encrypted: i=1; AHgh+Rq6d27BDSqNMGRMnL0QlJKEl+v3YhDj/X1FJwzeHjj25ufP6kNvRIICWUn0fJrLKW4ZJHMrqcH5JyLubu+s9trc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0f/bSX0sghKuYYcpDTyUGRIma0V94BUBM4c/yIQXc4IQ0WxVf
	2mjFA6oou1JXapERcCa7jLwTrBYYfb04y+b0bq5WnXNr57IBr5i0czbQyjfieY/8ggs=
X-Gm-Gg: AfdE7clEZ7X9O6NoS2B3WCqPieousb0E9NnMo+8o6goadpg8SqpkjdOtGrtrqN3bE4l
	pQFWBGWrOzDDOwLkwCklN16d6BaaYCl2zndUVHk4FJNHN6jLA1TxGgoSkE/6DZx6+wPERDpfV9K
	EuDOMCMPvdGe+wvMdP/k4+sOBWNtldqweHqLJ7akPm8TecJDjvckS9IODEL7cahIaMDPn4jmrvo
	fFCShdtvDKuGWFMVzhXktKYKY5CJP3sCB5uxx78h50TEU3MGQkDDC7WF1mEmvl2t+WCcsmdD76+
	c5ypocHB9/krCyKSl/8wQhxbctaSS02Vupyt0IWZH9M4pHhfPLboBG48fJoKhLDsxK7JJHJi6Ya
	y8VbMgR3Ha2O8CaEFDw/lhJpckgdvFSG2HNygiw9cR7L5XfP+3T6VIW2I3erlJvHGOZaxx9zp87
	63YA==
X-Received: by 2002:a05:6a21:9206:b0:3bf:a638:4371 with SMTP id adf61e73a8af0-3c3ad5d4660mr18319984637.10.1784609924997;
        Mon, 20 Jul 2026 21:58:44 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20bf96sm41516259eec.28.2026.07.20.21.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:58:43 -0700 (PDT)
Date: Tue, 21 Jul 2026 10:28:40 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cpufreq: apple-soc: Calculate frequency as a 64-bit
 value
Message-ID: <gleaxjdn6dyndlqr4lfgyvpnyje5rwznrktjf4e25giozkwjas@cp7upcmeae4j>
References: <20260720-cpufreq-64-v2-1-72bd9b4e5ca0@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-cpufreq-64-v2-1-72bd9b4e5ca0@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_215846_923485_D314A8AD 
X-CRM114-Status: GOOD (  15.12  )
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

On 20-07-26, 09:25, Sasha Finkelstein wrote:
> The current frequency calculation is done in 32 bit, causing problems
> if run on a future SoC that can boost higher than 4.2GHz. Ideally, we
> should use a true u64 instead of unsigned long and "knowning" that this
> only runs on 64 bit machines, but the core code uses ulong everywhere,
> so this should be good enough.
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
> Changes in v2:
> - Minor style fixes
> - Link to v1: https://patch.msgid.link/20260703-cpufreq-64-v1-1-c406c705319a@chaosmail.tech
> ---
>  drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh

