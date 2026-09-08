Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7A9C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0ot632abDXUhRdAYyei8Pmi85X+F5W6JzkBTKWHobg=; b=H7wtKW4BZyI/X2EMMXdZKLLkSV
	wucsSSTTy4gpjNRrFAowJEVkk2wGlW2QRb9TJcbPhtL94d8XBfnsskLwRL4hMSQQB3VrsVlxiaAGA
	0vJRpedh9f3Jur/ObETjY5EoOpMDLIGR0jZRANpXdjEIv1sB8KwQVbvGrIn3DpRqQ+Bjp+I+lFwMt
	7NCj4R/ynBIupvJleB+7aJZ5vcjTUPzVAzW5bsiyTkMQVd5iaQbEh7Rn4NGZ0FsP8pdBIByuhxroY
	0AlVOIuyme0MjheWWi5uZC3OJoIDIn9z+lQMF7JGeGb/SmxlSrpuBR7nDLvUNZzdZt4dwdaQtnIzV
	27An6FaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yRK-00000009bfL-3BdL;
	Tue, 08 Sep 2026 16:12:54 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yRI-00000009bet-3iBh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:12:53 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso3571228a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 09:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883972; x=1789488772; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G0ot632abDXUhRdAYyei8Pmi85X+F5W6JzkBTKWHobg=;
        b=pznSBgMvUd3JUdDrVoWbglf4qy2fE840dRoB5QydKTS9xixFUlvVRTJqOybUjvLAVO
         nPRvOzjZbuRZqOmVN9ORudhJ9x4aiRWzdvU3Q5IN0YpZcLv8zTQ4PJLvRFvtSTZADZf9
         8jJGlTEqYBX5CPqyG7KJeJq6wiYYO1gJzMykGbXK5N1LfSXCtaYcHna435+yB/IQ/yoT
         LbnqjnElbfgSoxCBl0BFalkevhvPB7yK4U3/vbTqmwH/yQ+scl80YvM5yq+5nRd7tb+u
         wQpl0lGkprKUTeeXIQcstp25c7YA5cPCRovXSx5yzbmjiD2T0rdAy8UOv0KK+flRWzU8
         y33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883972; x=1789488772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0ot632abDXUhRdAYyei8Pmi85X+F5W6JzkBTKWHobg=;
        b=L+9x2miJ4ulSbnXd+UQhKgDyYuFs2/gWKmd/YAicJzq87Np46W+VOdg3ahd9quCyLJ
         ABC5l29J1/M64nvPCTHtZs4c4s3oAbIKVbs+9khAUXabiBB4MH2dqFBs171Old40ryVc
         aop8Ecrm82I1+mcUkhMbZCOMHS/VCMKFB7TWQnpXCK0Rn6eZRkQJ0T9nkHrsav9I2IlG
         MbSu5cp8i5ZkcuoEsAuAMyTIVmsO561QNR5QU84CdWg5qYX9S8AoTA0r5FcHsXz5CHbW
         CIDCQSielmbNxMhzP+EO/jq3DO9BLyrISZxOdzJp8TZjHLZyjxnT+QEwH4I4LSvfumUA
         /4CQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeIyUelc6h6XT+SrX+Ckic+TxkOrdRxSwgCE5QkbGkxbC6hF9zTTDlvZmcESR/Mn3d0NpujYWj01JEdshrScSJ@lists.infradead.org
X-Gm-Message-State: AFuF++nII9HoT4PxYfGkBZUUwIlZ4aSdfwiSWxU8i4QhcZUl7Xqj+qHv
	3iJOMSMmdvVGIaLrmm+Oa5TEMhs2K4++FdmPfatrJ15Q411+Qd+SbZWm
X-Gm-Gg: AYBFou22Hokjy3GpU5iZVLl1stHoK0YX+C7wQdV7odF9MdPww52yCBwCaB4/9kWPG5J
	qWwqOfv3fiq1qS/rrjYOOJJTqamsNBd4cG93AvH7md5waONqENDx9ztCe56wN1phLntMGcL0IFz
	HMA9UHeVevvYGOc1Rupjnm6hMaQavGOYMJVofBHl1++lmeLn/yA1C1PlHUJKC8Iw6x6S+wmw873
	89A4n++tebUQt+u5g1FIGgmVRgcZykvYpd++y4xq6O+kxugL1mXqKXh99TufDJ3JXZB4HXpB7iZ
	IvJVCWm8n7V49LN8SwIZDE8nm6izR7AERFQa093YYjM9XrYNLpwYoSV1+X4Uc0QeAyWA4Isvwww
	FokSEDWP9FERJSUwER/Nt2TBa2N71Kn4RwKCTKbyKKp7V0D6arauqsJ6t7biblzE+gPftel5t2u
	cbfTCVOC/T0PiFJa/tURGj/1Jj5F+7hR249FkO3TCXtQ0eRl/a/KuS3uzOTStV5AicNcSX2pLvy
	A==
X-Received: by 2002:a17:90b:4b0c:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39b26121f6cmr45189132a91.2.1788883972013;
        Tue, 08 Sep 2026 09:12:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm26901209a91.10.2026.09.08.09.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:12:51 -0700 (PDT)
Date: Tue, 8 Sep 2026 09:12:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/2] hwmon: axiado-tsadc: Add AX3000/AX3005 TSADC support
Message-ID: <5f01098a-9d83-4f4a-957f-835d63196a98@roeck-us.net>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_091252_928584_CAA76624 
X-CRM114-Status: GOOD (  15.24  )
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

On Thu, Sep 03, 2026 at 12:09:48AM -0700, Petar Stepanovic wrote:
> Add a hwmon driver for the temperature sensor ADC (TSADC) controller
> found on Axiado AX3000 and AX3005 SoCs. The controller measures
> temperature at locations within the SoC silicon die.
> 
> Each TSADC controller is registered as a separate hwmon device and
> exposes one read-only temperature channel. The sensor is configured for
> continuous conversion during probe.
> 
> The current TSADC hardware does not support threshold or alarm reporting.
> All TSADC interrupt sources are masked during initialization, and only
> the current temperature is exposed through temp1_input.
> 
> The averaged 12-bit ADC code is converted to millidegrees Celsius using
> a lookup table with linear interpolation between adjacent entries. Raw
> values outside the characterized lookup-table range are clamped to the
> nearest supported temperature.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter

