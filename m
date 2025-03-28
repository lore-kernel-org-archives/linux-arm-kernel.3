Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F1DC36013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 08:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSnI14BbYG44AW/1FazNe/GgOwu32Ov8br248K1Kr2c=; b=f5r3CXrbiYi5ue+J6no7sJbd74
	7kbNDirIQiuZRt/OViyXahz54ohGP0XLsSjWB3jrhQeWUN9vZbYutSELlxnPU24zv/x1NDDUKolQn
	+K1furrBIBlcloDN1UYJ7H9R1g0ulT3BHLwLCblq8ICTNsbu7C5cHrz79q1XgzKmtw2MBeL1ot1sg
	VXJWgOffi1ZXL6a8mvv1kGYaqd7cfa/stx2RZPMNREECQ7FVNazj202cmPN4j+SkVY6gB+SX/9t8i
	DTGu1gmwfbuV/RIq7HxxvphmWE0uBEE/2o+6IVFbBo4rjWkwn/x3fnXKObC6MQHxj1Pb+BoLh2Ep9
	eU+a4gQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4nO-0000000Csjt-2a3C;
	Fri, 28 Mar 2025 08:10:30 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty4fL-0000000CrSL-0xnm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 08:02:12 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1033770f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Mar 2025 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743148929; x=1743753729; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aSnI14BbYG44AW/1FazNe/GgOwu32Ov8br248K1Kr2c=;
        b=XlCyOUkpV8q1rjU0xpQ1/lgmVJ+o5ZmEOxUL+2dvtBj60Ti5Uaot94hRFTqLvyucxJ
         fEKkDvPh4EM3uRHJ+yET7qxoS5wOJFusSvvAqxiYnRWvMJ0rWk8FZ4aZLKxwaYyi5cfM
         k1UK7OKqk//6kWYEg1tlsyGD6DZ9ybvjlewOhSM3MbOZF2I0f3a1ycj8KBUefYt4/b2o
         9NrQr3Z1Pi6BakxTm58oZBfNE8O4QTT2b3D+oZfmO29Vjn8kUUrmWSyl+JO/J+ZVP+OW
         gGdx1g6kP2NSWn+gtCvpVp0sOdnp66gwf5zOWii4NsiO33G4D9o2igoDS3oARlAwj8Fr
         71dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743148929; x=1743753729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSnI14BbYG44AW/1FazNe/GgOwu32Ov8br248K1Kr2c=;
        b=T8R2YnH5WnggwU54vUf5m6N4we45WksljMBqskbrAe1S8gI+KkuMQxdGZP3HWzDdTO
         oN3sAlG/oIOxZsEhsjTIxxifDMWiNVOmK+aHiSguSYtrzAAg9v5I6fJb7aiPK45MO+Lp
         MmXAz+lXjXPw9Z8ihYApzAPFsHrRZFR+XnaU95Epm3WdwkefNlFVXpKXyZGz13yoEV9W
         d107rXtpQ7CJqOs+S+AWCcEyJupgttn97Ai0yr78eduvp1rUYs7CydfbA5qJRKoXaqyF
         PCWe4UezW83ja3cpNYzvhDuLVjlqg9CN4vmXKAP3z1YeDm3e6D2xKoiOZXvk2pY/gpi9
         hIQw==
X-Forwarded-Encrypted: i=1; AJvYcCW3p6/ezS8wAjd4qRS4lFu+1Ef/S1HXgCK7AJ1J7RC3utYHR9sAu07RjN1mQl07O73fiN/YnaNxE/WnIorxf5NF@lists.infradead.org
X-Gm-Message-State: AOJu0YyK5gVn1Y5/z8UI/nhjUB+SJC/5Sp1VqrnQVXIoFEkVRUCkoZqc
	exFdr2oeOP+2/uLqUfoVDx9ddkOkEwjUWVVjzbHvCem4lAba3l5VjdkdwCYR6UM=
X-Gm-Gg: ASbGnctVdBJfPU6k7KZLl85qYry2HhUGYOJcp5pB2L+N7ulikdm+bO1EPd9+6YLU+57
	gWZhfx/ovDpCrVUHOUGa1W8wFPY47WtVL/EU9Iyiu4alThZqFuW5C0JvHLNniMfPuQP09WT1JDs
	+E5oBBEfY8yXqv07BCvcAPYX57AiRnNtidfQ0LsGS4kMRsMVrBH1MD17Y5zmSCznonMikeVRNuU
	kNF2Um9Ck5XmjyfpTJAefBtBnh0sjaV1GYZyQ1q8VsrWiWuP1Ifb3eUqwnCCPcpIcyXDqDaNjrb
	yc889KFSYrH2TmN66Ys2QuEDTeiO26xplzDk/N4s2XF8YEV3Lg==
X-Google-Smtp-Source: AGHT+IFJDzuS2myCBT8Z8eorHzwkBKAKIK4T2dNn586UW/tt61K1e2XI3JFfo+oVpAzMnbvgnYtY2g==
X-Received: by 2002:a5d:5885:0:b0:391:4999:778b with SMTP id ffacd0b85a97d-39ad17505d5mr5896059f8f.28.1743148928856;
        Fri, 28 Mar 2025 01:02:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b7a4482sm1795937f8f.86.2025.03.28.01.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 01:02:08 -0700 (PDT)
Date: Fri, 28 Mar 2025 11:02:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Malladi, Meghana" <m-malladi@ti.com>
Cc: Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
	edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kory.maincent@bootlin.com, javier.carrasco.cruz@gmail.com,
	diogo.ivo@siemens.com, jacob.e.keller@intel.com, horms@kernel.org,
	john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
	ast@kernel.org, srk@ti.com, Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [PATCH net-next v2 3/3] net: ti: icss-iep: Fix possible NULL
 pointer dereference for perout request
Message-ID: <326ebaa2-7b8f-455c-bf22-12e95f32b71a@stanley.mountain>
References: <20250321081313.37112-1-m-malladi@ti.com>
 <20250321081313.37112-4-m-malladi@ti.com>
 <20250325104801.632ff98d@kernel.org>
 <0799d2f6-3777-45f6-a6b6-9ca3f145d611@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0799d2f6-3777-45f6-a6b6-9ca3f145d611@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_010211_272639_F669AEBB 
X-CRM114-Status: GOOD (  19.12  )
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

On Fri, Mar 28, 2025 at 11:46:49AM +0530, Malladi, Meghana wrote:
> 
> 
> On 3/25/2025 11:18 PM, Jakub Kicinski wrote:
> > On Fri, 21 Mar 2025 13:43:13 +0530 Meghana Malladi wrote:
> > > Whenever there is a perout request from the user application,
> > > kernel receives req structure containing the configuration info
> > > for that req.
> > 
> > This doesn't really explain the condition under which the bug triggers.
> > Presumably when user request comes in req is never NULL?
> > 
> 
> You are right, I have looked into what would trigger this bug but seems like
> user request can never be NULL, but the contents inside the req can be
> invalid, but that is already being handled by the kernel. So this bug fix
> makes no sense and I will be dropping this patch for v3. Thanks.
> 

I don't remember bug reports for more than a few hours so I had to dig
this up on lore:

https://lore.kernel.org/all/7b1c7c36-363a-4085-b26c-4f210bee1df6@stanley.mountain/

This is definitely still a real bug on today's linux-next but yes, the
fix is bad.

drivers/net/ethernet/ti/icssg/icss_iep.c
   814  int icss_iep_exit(struct icss_iep *iep)
   815  {
   816          if (iep->ptp_clock) {
   817                  ptp_clock_unregister(iep->ptp_clock);
   818                  iep->ptp_clock = NULL;
   819          }
   820          icss_iep_disable(iep);
   821  
   822          if (iep->pps_enabled)
   823                  icss_iep_pps_enable(iep, false);
   824          else if (iep->perout_enabled)
   825                  icss_iep_perout_enable(iep, NULL, false);
                                                    ^^^^
A better fix probably to delete this function call instead of
turning it into a no-op.

   826  
   827          return 0;
   828  }

regards,
dan carpenter


