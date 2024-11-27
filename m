Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF23D609CC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qz+EP+l7Qi3fy38Fu3GsKedJkFdI7GfNaCEpN7e8AWQ=; b=DPb2oBfu46LvzBCVscwiNEd6pI
	6m4d0Nd5/aPCmikfDKn5BFhTxGK0Yb6dUjCMXjSwMZ2+gS0JRqxHWU+iigbVfArq7fdoFsiY5kbz/
	TcETBEzp3toONqWgUI/b/iIabVguds+kjSa/drjXooOMOZn+Bb83bvSvAoPh0QGy7+lcT7LVy8O+Z
	PQtFZFfGYmu8Ew0wDd8RBEq8aWg3fYOdhL5KAxJcEgnzCcYJWYS/HrCr06kWO3S7NsgoqIRSNWACr
	tmN5QAhHzGAHKkuSVLanu7pebEnbVrTRi5gUEYPDZlRZvsm1WhvOO8Lq4qKbcMWORkDMrJMPlbVm2
	btKlwaGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFCZ-0000000CpeI-1UqM;
	Wed, 27 Nov 2024 10:23:19 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFBS-0000000CpVl-2on9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:22:11 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21288ce11d7so52143665ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732702929; x=1733307729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qz+EP+l7Qi3fy38Fu3GsKedJkFdI7GfNaCEpN7e8AWQ=;
        b=DsCSgB8ky9hcz3qNDN2/n2EtW/zDy9pr+H/jRLFi0TL7SkAWR/exKackA05GeMBt39
         WPwnNZjCBIUkfuDmwGu9Zk4tUAVhYevytviufEK2hiR4Mo52/XMgu89iwn+7opF938+D
         9bf+yp8vidyzO55N7HHQ9NQZeOOojFFIeW8j3YOVkpYBN7nQufFa0EIxxcbLr+WeMLQw
         tCf+qSp+73hLU87ltlE3rTtQSWdXXWCh/Ost+Hu4pkWOvOlFtuPYakQe/FxaRP/LZC12
         vkZphMzLcB4kf5ky60UaDTan/lGcDvqFB/p24sRy1owMYS7WzTviEGPdvPXyR8SvQZtd
         Rvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732702929; x=1733307729;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qz+EP+l7Qi3fy38Fu3GsKedJkFdI7GfNaCEpN7e8AWQ=;
        b=XMxQs/DwJV56f5gLW5JW5Vef5PE4trcigMliZ0N7TNwUe0gmmLMJXhElrIWO8KAlSN
         whxb/P4uLCb3r19MbuyyPXq2CQxLHuiqPsUrv57gRpnoTR6CyzIgEVXtsodH2dtzLWGy
         /3Ho5m+AHwnIcmoeEHrZkS0/dXmCQmQ2Pkk7EvFt/nd1acDKg2g+gaFoz0j0l839H34y
         Yuhhj0ruL0+lkV3GhoaWwOZk6HsJJv5OUOgjg6T2AKP/dnajN4v2ET4duNY9EI+cKHTy
         OucU3YyiNKSAOoeOJD0t4iFghHsH2y+sK7Q1Lj0QRJmP1Q/8p9uVPrtixKOyVdWPzkJ2
         7cYw==
X-Forwarded-Encrypted: i=1; AJvYcCUUtsonvPSf6PgClXKQUVhhmZuRcrFpLVxRTA6gw6lp6TEF+NFx/CwbqaR6Uvki8zGWqMnUSm0p8141ZvKmTBga@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0LmOmFydavks0OELMoqvU890cyiit2gxVzHnBxGhaVH3Y4s8p
	/s1toHncNZlczc/CwEG7kA410lgOsBOCQeWljnyAu4s7gd81TxLd
X-Gm-Gg: ASbGnctTqgUqA9SIwWnKhLmYZG+7zCjSpSnvo4FRAtDRC95FghcFnsP6XDlGQoTOrH0
	/BbQlTytVRQm7FKO90h7whhCpkRm+cpkubCzY7xurciGHwAw8YQqikZr2BN5inZo3RD/uq5oJmf
	NPGIw42c3FSknKYjLXhkfiNPpTfO/iQa+hKiXNHL/5dHyt+eBmhIAQueYfag9z6ilvo3cTfYjP0
	+DZt14SvBPsTQvYJDCsMM7bmNtiQ5H5FFxVVYuQ/kHJ4/9rfCPsWE0b
X-Google-Smtp-Source: AGHT+IGjRx2ovLJ/PK1xeg/mE4q6TiXnbUVeTxirN9MONHEAnthNoTHl5RsWr+Fkoonsn8w1pCxhfw==
X-Received: by 2002:a17:902:ec84:b0:211:9316:da12 with SMTP id d9443c01a7336-21501381d49mr27610445ad.22.1732702929243;
        Wed, 27 Nov 2024 02:22:09 -0800 (PST)
Received: from ?IPv6:::1? ([2601:647:5e00:4acd:e351:853:196c:a120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba3588sm99445525ad.86.2024.11.27.02.22.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Nov 2024 02:22:08 -0800 (PST)
Date: Wed, 27 Nov 2024 02:22:07 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
CC: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/4=5D_input=3A_apple=5Fz2=3A_Ad?=
 =?US-ASCII?Q?d_a_driver_for_Apple_Z2_touchscreens?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAMT+MTRTzPwo7QveP5Zt_4Zycu1qohe5g8srC8O8Jo+O+-wLJw@mail.gmail.com>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-2-c43c4cc6200d@gmail.com> <27amnmlm52igidlv23h3d3bvaezbdumedfkqicbtreka3llhqs@fafepduxgv43> <CAMT+MTRTzPwo7QveP5Zt_4Zycu1qohe5g8srC8O8Jo+O+-wLJw@mail.gmail.com>
Message-ID: <3FA9FD56-ECF4-4E2C-A300-7E552F60987D@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_022210_706785_90CEE219 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
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

On November 27, 2024 2:19:38 AM PST, Sasha Finkelstein <fnkl=2Ekernel@gmail=
=2Ecom> wrote:
>On Wed, 27 Nov 2024 at 10:00, Krzysztof Kozlowski <krzk@kernel=2Eorg> wro=
te:
>> > +             dev_err(dev, "unable to get reset");
>>
>> Syntax is: return dev_err_probe, almost everywhere here=2E
>
>Per discussion on previous version of this series, input asks
>dev_err_probe to not be used=2E

They twisted my arm=2E It's ok to use now=2E=20

Thanks=2E


--=20
Dmitry

