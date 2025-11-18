Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356D1CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 07:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1h/LtINK8q4zriSv56jSMYuYj4wBO4XsX7/xajbaKQg=; b=LhIZUKYBa4vPbLDScWRdAgJ8r9
	H3rc7bUVXFUPatbiwtHlZRw5W4p+qLmr0sxmH/Suh0oaofQHUi+EXkzPW0fSJheofPd3eCTpPenPB
	sqf6eLldxXvKKmzQTfPEciEr3TmgMBiVLggFU3k6UpygPYL+5OR67kALEMeNncIs27pc6sxg+sVJ+
	DQjLUHD1NSLW/RvuDZ+yURPJX3pIryerNn45aSefJCYXTYsl+mL2vsnYKL7ZZA1UH6f9tvoew1O30
	r+qIeTgVAnWvC+AEC6bUwTGsXOVmw8TnNO0BIH7XTDjW/M+CO9e1QvnTn95ylGLn2akpYrfJy/91C
	6FuriVag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLFy4-0000000HXvy-0fhI;
	Tue, 18 Nov 2025 07:17:36 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLFy1-0000000HXv3-3TL4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 07:17:34 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b553412a19bso3810735a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 23:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763450252; x=1764055052; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1h/LtINK8q4zriSv56jSMYuYj4wBO4XsX7/xajbaKQg=;
        b=HayV3wRSSmvCmagaWzhp2p1S+AmyhUhI2uvB74jib93v1xnRRYM6PHSUDbwM4KAN/+
         xCFd3Mket/EBcankl19qbRHPgb2XxGKF+wAfXnmSsKYuBWs/K/YL9OCLBmuiBUwhttAM
         cl1fMTo5i0BgjQDwwwjEsLoO5czvanyIGrOZdz5Ai2AMO1DyO/0/QIWwf0DjvTPpYyGf
         z8IVOs1jMcPTsvQHuPD/K05nsxSFFrX2jpFQp+XxdaC6ce2DqvHlNXc7OLcuDsuT3zaG
         uqDelYqY77DFMXRK0SWu5cgAtZSWBE+Eub6zqGxuPdmrplqxpsjuBiSTTuc/VAeqOJyr
         XDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763450252; x=1764055052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1h/LtINK8q4zriSv56jSMYuYj4wBO4XsX7/xajbaKQg=;
        b=fPddvYLGm1cZ9Mry35UMDCJZczYu8jMO5Uad/q/9pdOeac1vfNoy2U96a88jH2Qcfr
         FXUlHsklU1xkeTBkZEwnd3mM+GQ9N/GvC6oTHLBMXig+lGzqedQUDb9eYbnOHY+SwQeU
         kqD+9D0NV+v2JABT+deC3l1npwaBsWSN0jIDgd8D5JocVhE840pd8s7toviLQr0Y245P
         4gcDBc4k8+hJ3GqSnr3t+zzQo/jipGZ83jgmVJkcTuYW3E6SU/FKAFxIBRiyKTCo1pLk
         F2bs4gFZym/HEqx+/8EniAu+BjSdmjPs0z102CroPSwWxhSw//7YUF4rLx9bhbwaD0Nw
         8xcw==
X-Forwarded-Encrypted: i=1; AJvYcCUrxl6YMtGe7HLc2NHPuVNN5ZfVfOZ0oAQzIeu7fKqPRsIEHbMoR+dxDK0H03XExhWzXPhGRkHRcPqHl7yBUG/N@lists.infradead.org
X-Gm-Message-State: AOJu0YzS8e4QcvpMumn0o8w+sq5JNNEZpXC5Bans6biv6DuLO9PePPzt
	tlnQ+IsN7ofiMLt6oXQ510HOABigb+6c94w4Setr4ZBatfE8nbaGgUblM0i+j/6R
X-Gm-Gg: ASbGncv+7PNUfmDmV2Pyqezl0IGDw3P8+gCFo6uVoOk8OMH9SIwTFH+olHWZgmovDSV
	WRtmoj1b5uGKt4d4uEhan4LDjdt3mR1v3Y+cGMZ2TnhQHeSPwRDEYcSaeoaYx/8Tl9Af7ht9xwm
	oU7XZQWcXqxJ8k4l/CnYLtXWCG+kz6oUpt/6E0dqRNRm/yN2xo0FhRaIMvQRQyiIZixBoMaHnpb
	sInJzvSshtYrJKJsOwWLbE2yj6QZf794azhBW8AFjBNnbd2hYj7PiGV0vE0tCGDLcQv++lBfPgX
	Dh4Y+ewz4AzFlqmgPIfc3onMEUj2E+RNXQHJB+TL567B1tzBjHzNqeOR7njsfMThFvZTeqGtdWw
	Xo0TziN4sT/1IkGYG/0h39hyiKbj1A5sMoxf/YSEa8LBFCTsG5Uwe9NimYe/RGwCsU0bPbmd1GA
	==
X-Google-Smtp-Source: AGHT+IF7vM7dWQA7a8j5a3/LMB+ij9tgBYk+NU42Vt0dswOO93rmrv5IDEUmNpYrednFhDvN1YDVVQ==
X-Received: by 2002:a05:7300:ce8e:b0:2a4:3593:6453 with SMTP id 5a478bee46e88-2a4ab88119cmr5119698eec.3.1763450252407;
        Mon, 17 Nov 2025 23:17:32 -0800 (PST)
Received: from geday ([2804:7f2:800b:b822::dead:c001])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db7a753sm54420555eec.6.2025.11.17.23.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:17:31 -0800 (PST)
Date: Tue, 18 Nov 2025 04:17:25 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] PCI: rockchip: 5.0 GT/s speed may be dangerous
Message-ID: <aRwdhbt0AcLQ1LgF@geday>
References: <e5d5c0dc-81d6-ae0e-7552-c2e4fb39bb0a@manjaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5d5c0dc-81d6-ae0e-7552-c2e4fb39bb0a@manjaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_231733_870220_C2962D77 
X-CRM114-Status: GOOD (  12.69  )
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

On Tue, Nov 18, 2025 at 07:45:45AM +0100, Dragan Simic wrote:
> Technically, you shouldn't have included my Reviewed-by tags in some
> of the patches in the v2 of this series, because the patches were
> either modified significantly since I gave my Reviewed-by for them
> in the v1, or they were actually introduced in the v2.
> 
> However, I checked all four patches in the v2 again and everything
> is still fine, so just to make sure, please feel free to include for
> the entire series:
> 
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>

Hi Dragan,

Oops, sorry about that, and thanks for calling me out on this matter.
I'll definitely bear this in mind for future submissions.

Glad it worked out in the end.

Regards,
Geraldo Nascimento

