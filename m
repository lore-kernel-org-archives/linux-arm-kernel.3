Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E67C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQbFhcoDrZBPCIQTDm/+1b8V56ThPOVb0NP4CFpNh3Q=; b=BCNZZ5HnwFEACxvZ+BPuhImnoF
	N5ZY5RUMjuNOArKi1/ipHUh8yaWI+TN25AEW+/s23jlwQ6Or6mNePvdOr5s1BZ6zd7q9WpBhwOnIh
	/DIbpnBhYUX4KvLmBgAFRt0WzVhE3kwoYxwOIVFkVunlifydV9YHVc+2iOZU8wt7grIyqklmcGgWP
	qFIPIkRq1HvNWCsFzPUdoAFE0cY0nxNTKKqfNXU8BIaJmS4+TGmfkkXupOKCx3EGnmqABI+XMBvIw
	IFMU1/mh3lZKZcRzxCHJkw8LZfqDllWBAN/JVA88kPPjegAJBWYm5nCzaPS9Rfe9+08xOsF7HpNsQ
	7iDZu4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR5A-00000004XCh-43ag;
	Tue, 04 Mar 2025 12:09:09 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQAE-00000004LBQ-3akh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:10:20 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5fcef5dc742so1434603eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 03:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741086617; x=1741691417; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nQbFhcoDrZBPCIQTDm/+1b8V56ThPOVb0NP4CFpNh3Q=;
        b=E4Rxoco9yprffbsbnV401JDvI9t/2GjMngm/s1WW8jCYhIKb62FLeYkX3TI+WkN57y
         D4Qn9RU5EJ4K7ir17L1lEVkqkAQoGbDyyeWQ0zIyxuSU8/8y1DU0lSdOcpdBkPFZ90Bp
         BgTdn9RPa20L58vV+piodEqiLnWw57DQwruYjDWvpW5LNGD4Kd6oIZOyXYQ2iMq+hbji
         v6e6LrQ4xWcqZvvmmfsRcUOqC6V02rtFROsoWAaArYA+MA5OKraXQq1qwxc8NJ8ug/e0
         eFsRL46zH/dArRRvrdNUbVjcuyHUKJZqB5OpYGk9zTuxLxlmVevrhfdXUm0VX3ImHVS1
         v0nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741086617; x=1741691417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQbFhcoDrZBPCIQTDm/+1b8V56ThPOVb0NP4CFpNh3Q=;
        b=sxTRRAXB7eEqcLS3Eij3TpwofoiyAhGlgIDspNXWR8y33mL0RMFbNnPvZKz2vFzuHV
         NM2vPreC+j+fecM8S+D+qZawviDhY/QqJuCwxl6UFCYc0YA7AoeTj7wJImo6oRiK03ym
         smknLf7hOKBptnMna/ISbxy9XfIUpB7dI/LufGFdYMDi6ZPb6cZEsuHKAeWTiPvm+qSQ
         AZgIHDjcjdXQ8fsP8XB2YGXS0raWUTEnWv8lzuaP1gyYTLoJSUyMjX0icZ1n+ojqQDXw
         jO5/7tVwGgM70GgtrKrZRjYz7nRrW65OyIF/TTxGsuiAw0VsigtfWBZHKHcTywuytfBQ
         JYjA==
X-Forwarded-Encrypted: i=1; AJvYcCXJgT2O0yMW47O9tA5/gPwKX+T8yza1n9b9bDDSm+tPEedKSfWrE/Hr9u/9L6WEye4r3ueDvSie5IFlemia4zhc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6iDaqVAcyVRWtnjUy0EFOp1pLc3UfSDPKVItM5hZrwRzQq9w2
	QahgcAXJN+6I+24KHElXWhnEQyQ+Wu+j/gxKS+EhUNz6qLfij2U1B0wgmgLanF6qYVxtpSG2Oke
	0rKSvVtq7uGndV5a8nsRf90Yy0N8oZCNYoaNi6g==
X-Gm-Gg: ASbGncuMx0f9SlAAEcVk1gswbQqyN5s8mu2cWf8DwwP4UAL8XoYJUFOE3faXCEy94aF
	A42AgURkFRAT49O+62FeBG1rvI7UgxlzuXQLtQ858RWjvPZbix3tDeEG6Okt9wze+t7vnowhC/K
	ZnEgocHwqO/UxtfvE2qhmA1eWYW54=
X-Google-Smtp-Source: AGHT+IEINRiNLM5nuBLFCz1du/UfXjBpJa2EipBY+f1wkfnUA0YwZBo+sl10akF+u4qE0h1ovmH6xsuQeboW1BoOyFs=
X-Received: by 2002:a05:6820:260d:b0:5fd:c5f:3937 with SMTP id
 006d021491bc7-5feb34b8657mr9224249eaf.1.1741086617654; Tue, 04 Mar 2025
 03:10:17 -0800 (PST)
MIME-Version: 1.0
References: <20250226220414.343659-1-peter.griffin@linaro.org>
 <20250226220414.343659-6-peter.griffin@linaro.org> <51ec6f40-c62a-418b-a538-082e3ad887cb@acm.org>
In-Reply-To: <51ec6f40-c62a-418b-a538-082e3ad887cb@acm.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 4 Mar 2025 11:10:06 +0000
X-Gm-Features: AQ5f1Jqwsn9oJaTqNHIYgxQUuylO7zocGAli9flyfTI1wTMKlEft2huZY8mFVSM
Message-ID: <CADrjBPqw-kt+4fLfJCziAJrtcV4gVM9Gubtq=7Xb8sgxq-i8uQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] scsi: ufs: exynos: Move phy calls to .exit() callback
To: Bart Van Assche <bvanassche@acm.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, krzk@kernel.org, linux-scsi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, willmcvicker@google.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, ebiggers@kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_031018_928280_B403D3CF 
X-CRM114-Status: GOOD (  11.20  )
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

Hi Bart,

Thanks for your review feedback!

On Fri, 28 Feb 2025 at 19:20, Bart Van Assche <bvanassche@acm.org> wrote:
>
> On 2/26/25 2:04 PM, Peter Griffin wrote:
> > +static void exynos_ufs_exit(struct ufs_hba *hba)
> > +{
> > +     struct exynos_ufs *ufs = ufshcd_get_variant(hba);
> > +
> > +     phy_power_off(ufs->phy);
> > +     phy_exit(ufs->phy);
> > +}
> > +
> > +
>
> For future patches, please follow the convention that is used elsewhere
> in the kernel and separate functions with a single blank line instead of
> two.

That was an oversight on my part, will fix.

Thanks,

Peter

