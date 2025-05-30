Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16377C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXA7FAwWEoQjWV4rxG699tTwIZ0uS94bp969KPskIC8=; b=sHNtyTMw5U75irOsvkR/EfRZiQ
	QzNmk8jtQhkT7DBG0W701Yk5T1roM+bmG+VAb0qX0gren2pXrylPXKJgU/ewZCcoeGysN+41HcXd/
	yM++i9ZEtcWSjiWSfGlOlu0fcLmmiAmXhW9vb/Kbuu8im2DkAN1SboUiodsvkM9Xc8/V4zmX8nAsL
	c4IH4tK4Fh8gd5nd0xlcCs2Tgb1unap4Qo4+TDVKmb9A9z9W3ideBex842Qi4/JxHDmQEyLZWFAQ6
	lWcHceOxaUNApBJImqgrYHAiQsh3fmRa+3fKBfFDQ7uSQR0/kfbuiYjXTga1gWoDlPI/33jdqkzRi
	8pOGvwSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzad-00000000jTD-0w5V;
	Fri, 30 May 2025 13:16:03 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKzYB-00000000j0k-1Qpo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 13:13:32 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6fad3fdf3aaso4279036d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 06:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748610810; x=1749215610; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XXA7FAwWEoQjWV4rxG699tTwIZ0uS94bp969KPskIC8=;
        b=Ln3NDezP4vdULs3X6iROGFetO7KuvBLQVheBfM4QnrBvXKMJIFL2m8EkeMBQTrB5/Q
         YUiwuFBqHQO1b+fBz3m1ud3Af8YkpOKTu6tmHKRqEGf15xntSc210a4C1uNdd3t6YYr8
         ObBQgy/AWq8jPYQTCRVngJtRK0pkXwiODUe6wXojOjay+wIg+HJAYZOKscRs5cLJ2d/h
         DM/jdqgx4j8m8+/1akz2aDr7inuMe7buWIA65ZdD0kWzX/mk72Zrxdbs57FqlzU2e9hG
         Uu1NUt+By7IaDFHFmkAXNIiucTjb/97T3r9HCRBbZe5OGT0yP+79anD3H+ObJ4G31zZX
         KEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748610810; x=1749215610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXA7FAwWEoQjWV4rxG699tTwIZ0uS94bp969KPskIC8=;
        b=Bw9X+WKvZk1twVg0FzUUjzze+b87za2O/86vsqG7l6Xq7SrPhprXlilLL7whCUmUbC
         IPnfw9KfsjbIspW/RjfLAJqBakyh76R2TCWPGywh+Qz8bXE3f/Y4F+xzLVFeOqSyRbbe
         Jx5B6fJpPW8EyAX6sJApVb4b6GlfybUAtTMwpvnmBlOJWKFMhjYPuM+NucRyvlc21RZs
         pAufxh9sVn7RPyJyhMN96b4mK8n4+usbsOQCDICIBGa/JhExoxsE1Vxf+rX+ZCUvVNAX
         JjWcKwztGCShHeqNw0FDwUVQtiSSeIhHxYn3NTN0hiQC5bVcu/WIICevXJqn842Cv1Ni
         SBAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9NJb3UbADOH5K3VbKYIZYm0LtY5AvQSxGT53Rfc19mJzKBv5ohT4EmExANZiLCtgkE1zdLc6IeUQCBCKxiMvy@lists.infradead.org
X-Gm-Message-State: AOJu0YyzSIdIjC+vrnkAaNn26lceZ39zADowlnLmdl8Pq6D2NuoHkvmq
	MXsriF7CGSsK52vO9Y+Rup35gA6HvC9PjVh6JRNgBKUeadi6dycJv5ahEPt+vZVceis=
X-Gm-Gg: ASbGncuPtQJ1+gp1w56cRXNhKxBzWzcXb9FPrhT1vpvusWWrfJS0Y82wAKxRKMIailR
	AawQ6Ry7S9UG8e9Lj0sLpHZ3DSOehUcRy1nuLDT1xwQrixtkfs9SUMZLeLVG/kzVN7OlrFywSxZ
	txKoLNZqJbFDMBvgpn/jQ06DMcaJgaIS+ncqMJoqfw7sQGw3ntyUbbTUWAQzAR4MQqVR9nd2aPE
	1RFHssrHlDKVDwBpav00BGPqspDIk342DYX4cerGPo506A0T6jVDeufCYKjqRoajqBve/vr4KvJ
	892I6eB4AVQP1+oQcJfIUrKikU9fZ9g+EkqVNBvIXqNlXbuzqF2+7r4J4PpW+c0S+EQQI4Lui06
	xRRMAml5jp4uyh41HmJj0/3+WX9Q=
X-Google-Smtp-Source: AGHT+IGtkifcyZecjpf7VInCkUgq6fH3Aod006JAllttC9Fo9yWIYJYoM2lXdlBl79Y0FfzZWiBAvg==
X-Received: by 2002:a05:6214:27ef:b0:6fa:a0ac:8d5b with SMTP id 6a1803df08f44-6faceb4f359mr56609796d6.3.1748610809691;
        Fri, 30 May 2025 06:13:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6c03c58sm22554386d6.0.2025.05.30.06.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 06:13:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uKzY8-00000001DzD-0cum;
	Fri, 30 May 2025 10:13:28 -0300
Date: Fri, 30 May 2025 10:13:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, Jacob Pan <jacob.pan@linux.microsoft.com>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	will@kernel.org, eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com
Subject: Re: [PATCH v2 0/3] arm-smmu: select suitable IOVA
Message-ID: <20250530131328.GB236098@ziepe.ca>
References: <20250410230008.GA6905@ziepe.ca>
 <67fff12d.650a0220.208c7c.d69dSMTPIN_ADDED_BROKEN@mx.google.com>
 <20250416181759.GF493866@ziepe.ca>
 <20250520224224.GA16365@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250525190703.GD12328@ziepe.ca>
 <20250527205428.GA14019@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250528000425.GC146260@ziepe.ca>
 <20250529182219.GA20289@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250529183815.GA236098@ziepe.ca>
 <20250529220839.GA9911@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529220839.GA9911@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_061331_553371_96A62E2C 
X-CRM114-Status: UNSURE (   8.97  )
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

On Thu, May 29, 2025 at 03:08:39PM -0700, Shyam Saini wrote:
> > How does your platform work at all? Isn't 0x08000000 physical memory in
> > your address map? 
> 
> unfornately, this 0x08000000 physical address is not in our address map

Is your issue PCI related, do you have a PCI switch without ACS mapped
here?

Jason

