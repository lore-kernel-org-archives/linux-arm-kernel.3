Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AC7CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 22:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTycPbHlQtDBtjOvMMJ3SZ6uhxSiX0nO4WaEP9DHCc4=; b=OMnHAfTS9oX2Te3HPpBP5S5+ps
	f3Wxr5IAt2w0DZmOo/2ocFW0ilnlYSoBYwy7Tz/n+JWpBQadFjg0v9AKWwe0IsSmzZXjtXm6OzDkV
	4+TK6zTqN+PRMqOVtqQHIxPFg9zwxNFRAqHbXWl3ld+/+6skpWNZZxFDWRNsNafZHqd+k8g09bI0k
	HgghqKMgBi5UyDhXF5oTk1CpZFsM8TTV6CP5iUf5CDeAclJr2xbznEjPeggGMlgNJqWpN4yuPw2t4
	mUIUa7zRjylgEXEH2bwxiZ7F9hmiT06hT5P8YeWLY0gUTv6CB+MwxAiEbD9e3lFhHJ9LIrDxaK0YL
	Ysd7kE1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyIAi-00000005qKd-0COM;
	Mon, 15 Sep 2025 22:59:44 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyIAf-00000005qJj-3RBA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 22:59:42 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-30ccea94438so3653731fac.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 15:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1757977180; x=1758581980; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTycPbHlQtDBtjOvMMJ3SZ6uhxSiX0nO4WaEP9DHCc4=;
        b=WdFDasX5nUjga5+k5DDqLs76m05k66g9m0qVYr466fHynr109aucPwFK6aDZxLrUA5
         GeFxIuXwOC3Qxt1X+MwQmeVC3MhuhEhRQ9B6aa0LMJlMArbJOImlchCE62wHJZDQfJrj
         GOhxc4GVoWzmV6wciAaE0IOQd4C1h1m6oOsyqYdAn5xMgsLOofx2yZjWgqQRjW1RuBuy
         wVbDtiJyNBB9UdlDB2d/QmGDC0Oj+7k1heVzkLMexMHHl9q2MRKjdUQCHWjw/F/Laxhb
         dypjU0v2NL6BdULUhjCFeJpt13Tc2BhMaeGlFnF+dv9kCn24PjBYVbIMaJC6BoKNJd1S
         Y6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757977180; x=1758581980;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aTycPbHlQtDBtjOvMMJ3SZ6uhxSiX0nO4WaEP9DHCc4=;
        b=k0PWs1rWbS8sWT1KlMsDAiDGAJrIiTeikcqpI6A34G7AKb4LKVJxYXKwkh0BOfYw5I
         45Prd47PF56aRthxvaETjxMshEV8aXO9S8fxi4bUHJE4xB/9LDP9FjlYX/GQEMvBA45X
         PNE8fxksOGTIpQXXvhFMGiHjKA93QwsaKYaKPxbPhqFUorOOeuY9JTcAllT7D/gdbUMp
         UXfYsWucQqT34pFMg9XWba2Y6EGuLUqGjMYgWuQ3irUor5f5fwRf9vxiP6QHKezepDXR
         gXohHRlc/+s6Z/PCZgJWDLS98e14NG+3YangF1wLEOeqQgFWHBi5fy6MAtZAP9x1iyLC
         2SMg==
X-Forwarded-Encrypted: i=1; AJvYcCXWcKmdA0hT34BW0VagEnOtC68Zp9t4y8CF/PaX1XozFSwSchc0uZOIoxMJ3KYUr0yQR9VQmawINxmfuCAbhNL7@lists.infradead.org
X-Gm-Message-State: AOJu0YyneTwwyZuSvS1WVXmJPD4BPwhR4ZfZ5no71Xi9zGihURKRCQcm
	ZWrl9Nb43TR7nkbbzfAWCDjTdcvcQk6+3bUyqE1YfHn72y8q/hq0z550pcMRZj1l9Rc=
X-Gm-Gg: ASbGncubkPCDTg/1o+M2mQ/0gVUMtaSYjIudp08dpiYJQ8SyYqop+oNXtMhiu2pbZ+w
	5Bdrbb0ZRXzf1HhW+7Lv3yafMkcjY8Wky/3prWjOFSdUD6WVj8QuIPJwp10bnZCH5TfWLiMgFPg
	Otke1di7CA25IP/qfb/SeIsT47mZZR7xGy5xE3zsoWqT38IMN1A3rwLKMIzBKIfRaoE5V+1JYtQ
	2uDyExLFysrqkzKMx7HIohi5Nq1XT9Q4jJCOvA14lQok3vxZ3jZB0ugfc6NNF76dQNy+Svr+PQn
	opEF2KWJO9qL53nKNcGqw3CxtZIV/Ph5qkdPvIDtiaOQZxu/hjBaMy+OM6VRXguyr2eV7Zn6YrK
	H+W29qBQ=
X-Google-Smtp-Source: AGHT+IHaizr3a2V9CFBUtFDTvOTqaJTANyOfH5v0JTyHH5V9DAauzxISXWz+PQumMIbWbikwaEyCPw==
X-Received: by 2002:a05:6870:82aa:b0:301:a704:ef1c with SMTP id 586e51a60fabf-32e56bc4018mr7508892fac.25.1757977180618;
        Mon, 15 Sep 2025 15:59:40 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3317d74fe33sm1565394fac.15.2025.09.15.15.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 15:59:40 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uyIAd-00000004YkX-1MrY;
	Mon, 15 Sep 2025 19:59:39 -0300
Date: Mon, 15 Sep 2025 19:59:39 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: thierry.reding@gmail.com, robin.murphy@arm.com, robh@kernel.org,
	joro@8bytes.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	virtualization@lists.linux.dev, will@kernel.org,
	jacob.pan@linux.microsoft.com, eric.auger@redhat.com,
	code@tyhicks.com, eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	lizhi.hou@amd.com, clement.leger@bootlin.com
Subject: Re: [PATCH v4 4/4] drivers: iommu: refactor arm_smmu_get_resv_regions
Message-ID: <20250915225939.GN882933@ziepe.ca>
References: <20250909154600.910110-1-shyamsaini@linux.microsoft.com>
 <20250909154600.910110-5-shyamsaini@linux.microsoft.com>
 <20250909155847.GB882933@ziepe.ca>
 <20250915162842.GA23954@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250915162842.GA23954@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_155941_859190_9FF7580C 
X-CRM114-Status: GOOD (  11.89  )
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

On Mon, Sep 15, 2025 at 09:28:42AM -0700, Shyam Saini wrote:
> > I'm comfortable with this side from the iommu perspective once you get
> > agreement on the DT representation.
> 
> We haven’t heard back from the DT folks or Thierry. Do you think we
> should wait a few more days for their feedback, or go ahead and send
> v5 as an RFC instead?

It is about normal to wait about another week and then ping them for
feedback.

Don't send a RFC, you intend your work to be merged.

Jason

