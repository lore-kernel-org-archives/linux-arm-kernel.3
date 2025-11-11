Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A05CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 17:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIPVTkR2pbZBkmPWapN1AZOJSBeQpLh6MMgTnPaEnDU=; b=xg5r312O5EzfyZzoZAWkd7aG0a
	nMoc95cjLyZon5TCoGbugb4Seo1AZOHxVlYBkbYqJYPpuIITsaTdbOGWyGLnRkQ8HlYCvb193H02j
	PRbwwRmhXwBnS6eL42+tBwYinRSrTWvET1WaDEb7hWEy0pIA+GgmaNjKPKsuA3SYXkDb9L9lFYG/Y
	9gUDNXRFGis7V1SZhB/Nm7D71849cArilnm13NBQbOgttrf4CtkdToOYsd7wTLBED7vlYoZoX3Qqs
	AM2TD4zEdrqN/j/CiU+9gMOQRCwakM8ikjTJB6o5Y2Ch/jhySOlrplL7FEOa+UXiSTc8Z5F6cD3OU
	uKe+FciA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsVS-00000007YhW-4BNn;
	Tue, 11 Nov 2025 17:50:15 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIsVR-00000007YhB-1pfS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 17:50:14 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-780fc3b181aso3869827b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 09:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762883412; x=1763488212; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hIPVTkR2pbZBkmPWapN1AZOJSBeQpLh6MMgTnPaEnDU=;
        b=XDqH8Wz83iOjyqIZhPSMt9yijAPwhVaxm0H+xmljp6PAmS7l9f4XX5QcTUKBe9tWoW
         G4Qje0+bQvBrAaI2Rj9zNzKuwvAG8eW+0Vzs/fuQ36Wr9B/OwMuGZu2eqZygardALHxG
         mpjpGMMedW7uVNBsp6FOsmKpXl0gB4aDRUj1y1VBDcvzBDcxf8+mFIGJAOBotVNVw3nY
         fRyfwqaVxl6r6qd7nmEY0TrCLr//RQ1AsllJgIsxMLGCOOUdlj2vrsf45/oIS4q8dg8b
         FIJFUGVLe7w0fygtoeF6JeoWZL9+5trhUwR4/Wq8brwOBHsbmk4lBaKBXBAXW4Bhw3WL
         DDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762883412; x=1763488212;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hIPVTkR2pbZBkmPWapN1AZOJSBeQpLh6MMgTnPaEnDU=;
        b=v4w7aiX0iziee8JdKd5MNFOw5mZwtFm+c1lJtm7AGYf1J8p2E7ILue7VeORYRMPwzS
         AMz+A28ZGnOvoItnISCsNrTCsGxTbNoHSR+xUKqS+XqtcwVpOGTjSzGAhQu4KZq+gKM2
         jpzMTM9NxMc9dq3XgFxhfqY3QPfE+RYf18sFxwZxz8lcj4Ax1qAw+reewi1OrB85Mlem
         dVtvEjdNeWsyETmveJOXuCibipRf1FsYhW70eZ2Jk6xCqyan2QyH6qW7iB5NOujINFeo
         16IrXr21G0U9eVyto4msEhZHLobw7KdnHqy0TC/gc8xFIUPnxblgrfbSKjq2fATvhtuq
         H2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMtxm1teEtsB2QUFo3Il3Noiovg5nikOKFPCAnAD/7cn5iDTHgQjlBVWWN4SbiKUfcQQXtJnTRPic8sxImaGeq@lists.infradead.org
X-Gm-Message-State: AOJu0YzDj3M2PXZe8BI1lzetfV0RzkFxMZX8X+KgRpYa1IGBRUzqx6AX
	XRTYiDQdPeQk8kaD+BAEroJaBK6Fi6UFNAUPl8DXy3TY0/zoIieOObdW
X-Gm-Gg: ASbGncuMVZvr6V7X/X4OZ+gsytodR/gEht2KtpD8YVaTnyjE4Gv49oHcFlXkstZDQ6w
	QeTr/+muv7tjtgqbNJYCgPJfnq/t6x9VEyq0Hv0lTyHM0GkIuqvVk9fRl/Mxo8rIg/TI7Rbbdv7
	3km0RrE+Oksk9lhbboPRvn+PKjrm5WuNSwoYyVQMj/P1DANaaaTbgAriznBew1BcoQYwvLXLd76
	PbJXumE+his456tfyxFDzIoAZf92TRtjolfmZzXYlPfZNY2gesq1iEIDVeSyu0mQ7xi7dVyz9cT
	WYveKKEL63II1mYNvOKznVkHYKQ56u91ZLr39SZL/mQx5lwW4gAWw49aNhrUaKh3QHFPwI9ZBjc
	4pQmoRI8zLSXV2026Yb91vUhi2nN3yfyz0hF9Z18KgvVZl84bxOsnfRnhlfHiuPtrrJf/5HU5Bk
	eH3kn3ccdJf0hSTVnCIwCV0CPC6r1oq/2R
X-Google-Smtp-Source: AGHT+IG2wLRt+FHVuVKrFyDk6D87jUa6ulKsRTc4ElvGIUi+Ps48OV5Tavonxqr9dChaqkEyGsQG4w==
X-Received: by 2002:a05:6a20:e210:b0:34e:b034:a5e5 with SMTP id adf61e73a8af0-353a385ab2cmr18505176637.51.1762883412297;
        Tue, 11 Nov 2025 09:50:12 -0800 (PST)
Received: from joaog-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bbf165f99f1sm230491a12.23.2025.11.11.09.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 09:50:11 -0800 (PST)
Date: Tue, 11 Nov 2025 14:50:06 -0300
From: =?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Kishon Vijay Abraham I <kishon@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>, 
	Andrew Davis <afd@ti.com>, Francesco Dolcini <francesco@dolcini.it>, 
	=?utf-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: TI K3 AM69 Kernel Panic when PCIe Controller is Enabled
Message-ID: <lky7ocqazucnh3xhwswvs4idjtljt5ixp3ibwwa45524pvxzrs@kmkml6td7vju>
References: <pod3anzbqdwl3l2zldz4sd47rtbruep72ehaf7kwcuh2bgflb2@y4ox65e66mkj>
 <cf751cf7-53a5-438b-9903-903bd8c39b23@ti.com>
 <oawjd2mscz2untz6zc5mqn6ak2oxdul6pnaexiohe6ae3bow2r@afkvpu4izrvt>
 <ddc4e2df0a5593d4a6051057c6406db338f4c0ba.camel@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddc4e2df0a5593d4a6051057c6406db338f4c0ba.camel@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_095013_481066_8CB07C79 
X-CRM114-Status: GOOD (  18.99  )
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

Hi Siddharth,

> I have two suggestions:
> 1. Disable ASPM using the Linux commandline option:
> pcie_aspm=off
> If the bootloader that you are using is U-Boot, you could run:
> setenv optargs pcie_aspm=off
> at U-Boot prompt before booting Linux.
> 2. I had seen an ASPM issue long back in 2022 and had narrowed it down to
> the Data Link Layer being inactive when the PCIe Core in Linux accesses the
> Configuration Space of the PCIe Endpoint:
> https://lore.kernel.org/r/faa13ac2-27b6-94f3-ecde-60256bbbda1b@ti.com/
> The fix for it is the patch to which I have replied above. Direct link to
> the patch is:
> https://lore.kernel.org/r/20220602065544.2552771-1-nathan@nathanrossi.com/
> and it modifies the ASPM driver to wait for sufficient time if the PCIe
> Controller doesn't have the
> ability to report the Data Link Layer state (this is the case for the PCIe
> Controller on the AM69 and other K3 SoCs from TI).
>

Thanks for the suggestions.

I tested both of them and still have the same issue.

One thing I noticed is that if I keep resetting the board, sometimes the
issue doesn't happen, and I can access the SSD (this is independent of
having any of the fixes you suggested).

Best Regards,
João Paulo Gonçalves

