Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1D4EFCD9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Obo8Gy0XA25wtJr5nUH75+SmBoDD9gzbxy0pse51zo=; b=0WbOrB3MZp0NLc2Jw9FNmVPpxF
	8iYmSkj90PFFFdCgPKtJWu0WhgR+scaOY5+xN6CV7DlcbxLVjGXNeGCEhq9xQ2Jsi2dk3AMe0ZLpq
	Qy24uTvuwUxFtK33qZVB0vSrbQb1UTpqqOMDlbMjABbS6Rvdtw1EKSbnMQWN5G1umJcJy0hlX3uXX
	y/IUKUmIlMN0lbSI1f27ExAjy0EmXXQz6YPssVHQn77yiiUfRPDiOekpNz/Q94vn1g76Apid6ztKE
	ZNVpVi9RjcM9WSQYgifLDJQxjkjqTl/+ruNFiasHNoACcCuEVTqihVqe2GFmv5Mw7w4CDJSPGzJoW
	AVmZMEAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZ98-00000007ER6-3RzR;
	Mon, 09 Mar 2026 11:51:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZ94-00000007EOQ-1ECy
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 09 Mar 2026 11:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9Obo8Gy0XA25wtJr5nUH75+SmBoDD9gzbxy0pse51zo=; b=Occxz7TgsNxH8kymTciFymAsav
	11F8WElBkIpXzycCIXM1KyTVQw3WjF1D0J7UHOlJ6Y/w8A7ryMJ+gMVT3c36m9h3K8QTRLFNThK2f
	QZrOGeHOz7HJEJgLJZpP3CVeGY4331PHAvLXoVrGeePrUPaMT3SrbI8Hn4JTBAKMNGBEFIIioMqlw
	Bz9P4pzBFDYkQweSThcbWhF3MHnl3M0zqbT1Xr/YjbZ59Ev1aO7ZZSumRMRdKKINTlCOrEx/yX0JG
	8Eh+3ehJIE6hs9w0yRFiuXdzsjsA4xiZAX/5tUo0DbeM+IDZDca160yBKoW8oM7KKpQ/N7i/9Mqqe
	8lZuIzMA==;
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZ91-0000000C2Tz-25QZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:51:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=9Obo
	8Gy0XA25wtJr5nUH75+SmBoDD9gzbxy0pse51zo=; b=SG4bHQQmR0rX7VosFKnI
	NElZQF8NdYgOe6TZz/zGTk1VPqhuefyIBm986kOuXEbLJyoUtjAg5041Z+EkkKZf
	4ePH4CzS1xgHvbO3mQL86Ls2+SDzm7nzk55wJKUo+v3KXq0/Rvw5VfIQKT3KG1/4
	uIcnJJEQNdmNDIUvQEsxWY9RFjKycq1zHcstssectbzJXGPr/ce0HvwyMwDtKpD5
	R5DoL5RAMLa2YblMV71ZYCGqsKzHBIQn4jmf0IzKEZ9cdUoDykSTCUeNbAQkB9D7
	KYqzk3Pp+blknRp5JwyNhRu7bGiAkuIskoATFCvKQxbufrTiTWzSgkWCoYFj4GaE
	Lg==
Received: (qmail 2760960 invoked from network); 9 Mar 2026 12:51:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Mar 2026 12:51:25 +0100
X-UD-Smtp-Session: l3s3148p1@NX63BZZMwKMgAwDPXzF+ANZpdrMKUeLI
Date: Mon, 9 Mar 2026 12:51:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aa60PCE3wsEAZbcu@shikoro>
References: <aaFcs1miP88QWmtH@hovoldconsulting.com>
 <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
 <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com>
 <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
 <aacE-27iaYneKCJi@hovoldconsulting.com>
 <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
 <aagSewpM88KAZDcJ@shikoro>
 <aar3rj7Db6NmTVS_@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aar3rj7Db6NmTVS_@hovoldconsulting.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_115131_648273_539ABDDA 
X-CRM114-Status: GOOD (  10.77  )
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

Hi Johan,

> I don't know what was said a conference some years ago or whether there
> was any misunderstanding on either side. What matters is what was
> posted.

What was posted was in accordance with what was discussed at said
conference. The people in the room (including gkh) were OK with the
compromise solution. If you are not and willing to provide a better
solution...

> Bartosz seems to agree that my suggestion to decouple the driver data
> from the i2c_adapter would be better, and I'm willing to do the job.

... you get all my support.

Thanks and happy hacking,

   Wolfram

