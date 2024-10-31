Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC25E68956
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gM5wWgi2TSKmVeY5SDcJMm3bhY1ZPCy6wez8pJ+kKGg=; b=Sl0TQlDgf33v8fWftgMzalw0dl
	mNnrNeOn/f/fIrspscK1s/wKaP9WkNQDUEbLS4dF1E5OMKwftDUV3TF6iQe4IFh7qgMD1YnzcrQtW
	FGOcV1i5fVPFC9maJ5j2N+iSkO5IBV4GQLhgEttdoOc/X5hPmwRbG6ag7UfuQhFwKykJ2PEVbpJ5c
	akng5DNrBrB6h9pYHwvbPFH6LMqUnvWKiwtOv02ELs6FyuQNG81BnDd4BADf6RkzzdfAtbTesjuIa
	p5KMge6rgNoxHfB27P9+LnHP5ZWsruJXHJNzMXFVlkQT01CxorAME8X3vXeetx3kWK2cwKQ4pssFc
	eLk83L/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Pbq-00000002oCx-02hQ;
	Thu, 31 Oct 2024 07:28:46 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6PVM-00000002nQi-2n67
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:22:08 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-539f58c68c5so1087245e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730359323; x=1730964123; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gM5wWgi2TSKmVeY5SDcJMm3bhY1ZPCy6wez8pJ+kKGg=;
        b=dUxppsdSCspiCWsOy1aDfH4C/swlOoXUE9MCcuQN5JL0SeAQnicU+xojFSEhCS/hWS
         C92TRa3rCPzxj+GMr2dE3BEx0Vv1/UY8h2X9ljex9Ej4vZSEY8RHi7cI0yFTXpTp/GAt
         i411lYqyCILfef3GBGcx5I3L9SbpQ3QstXVo99bKYyySSTz94JufHkLbk+dVLv7KPFY0
         xOsN2QdckHQEYy8bTMdEVGAX/wcRFnL/xuqiJerqW1f69DDsdABSISK73pBg3HPOnkpg
         2NC4dz0gHcz0VKnkBEpk78mnM04mgaWm9f3XdnWnxNEnQlmnqa1u383PTVwlhsio7jvz
         PGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730359323; x=1730964123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gM5wWgi2TSKmVeY5SDcJMm3bhY1ZPCy6wez8pJ+kKGg=;
        b=PEDsivzyJC/Ov5z2JSz2/H6hEsneMMeeH0dTCaSd63fq5xJlAmmhk0AYPuVlsiF+4N
         odOI0BiTYEGwtlT8Z3t2dSnGRR7RUL2B8HD1ZAJud9ZHGqCQbMY9vvX0xN0F1aO18feK
         s1aer11AUHn6lUqaRFjmB7npxRenYymjNKGGa+XiWzjCAERrnC/3TZSdAfopluleVLBs
         0UwOkSkdR0sva/QYTq5U5aP+7bwvGDE73HDgs1TAJtcF/AkUIfYbPmJcyBuOT4M4hfck
         U2ttz1EE5bMu1WqDhMEO8faXX9zizYdqd4/HruCsRnmO2SarNVICKxkBVmxsM0tVXYGp
         jdTw==
X-Forwarded-Encrypted: i=1; AJvYcCVFm/6i5uvcDCv7AQjotOEndlcVdBoNGnq0yYEINwjpuQ1OYaa+vWGrNdZmomBGt42YZBmI8le5VtB2M7xlPn78@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2uOH4ipsBV9Y56WaNQRaBZTcue5rcAyyx30beRzaMGORHELx2
	Uwli1+JTHMe92vPr5V7B8krtjXXxDEn20mTE6lU9pWeuNV6I0S+bkPEecw==
X-Google-Smtp-Source: AGHT+IEBjM65tt3SAt8nK0ae6K3GOnG5v1Naqby10xKQgpFyglnNtSWRc/TdgW4uy2gigZZl2XbJFQ==
X-Received: by 2002:ac2:4e16:0:b0:535:6951:9e1c with SMTP id 2adb3069b0e04-53b348cbb48mr14201223e87.15.1730359322220;
        Thu, 31 Oct 2024 00:22:02 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565e095bsm35533866b.99.2024.10.31.00.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 00:22:01 -0700 (PDT)
Date: Thu, 31 Oct 2024 08:21:59 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Cleanup Spreadtrum/Unisoc ARM64 DT (part 2)
Message-ID: <ZyMwF9AnVTEI1a_m@standask-GA-A55M-S2HP>
References: <cover.1723716331.git.stano.jakubek@gmail.com>
 <ZyJ1keHD-neTNZ2J@standask-GA-A55M-S2HP>
 <CAAfSe-uZ5KWfnZ=DqAy=4fJp0TrTimdEs0Vy57CYcsK06Ev_UQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAfSe-uZ5KWfnZ=DqAy=4fJp0TrTimdEs0Vy57CYcsK06Ev_UQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_002204_795497_806A202D 
X-CRM114-Status: GOOD (  16.38  )
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

On Thu, Oct 31, 2024 at 10:08:27AM +0800, Chunyan Zhang wrote:
> Hi Stanislav,
> 
> On Thu, 31 Oct 2024 at 02:06, Stanislav Jakubek <stano.jakubek@gmail.com> wrote:
> >
> > Hi all,
> >
> > not sure which tree this should go through, but could someone pick this up?
> > It's been sitting for ~2.5 months.
> 
> One question is what do we do about those warnings reported by Rob's bot?

Hi, you're correct, we should do something about those, I'll be sending
a V2 soon. Also found an issue with the 2nd patch, will write it up there.

Regards,
Stanislav

> Apart from that I suggest you send a pull request to soc@kernel.org directly.
> 
> Thanks,
> Chunyan

