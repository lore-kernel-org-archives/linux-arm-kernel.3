Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B37FCC048
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhclToYLpG+7UMFBLf2ZmC1LGWDj2lllBQ5Rm1+HHeQ=; b=GE9Wq08Y39VtOfLyT224YX7/eF
	waQuvQNIVLy7/mRlvKJhOWu4SwxJsemJ7GuH4QKGzAker5BBUq/wAVCpTYttVKLQc+YnH+8cNc2Ud
	fxn+00OzIPxTWKxC6FQxZ3f5WMn8P9oMW7wrRMfRIWFEHVS1R58cDo8+NlIrvBbZp8IPYgw7+ixlh
	jUfLUEvmD1ui+2wK681yzcoWtF6T0j7b8uhQKJcgK0uM1bmyVj5wRgEGzeogat8n0hCaY0Stbl/nc
	GYXEzoeyR+WOSTNh3ys8XVQe+zC+kZrT5Qj8rOlG1EeqfW3auFt9UxuFA89juId1NUsfzTPf/Kt8y
	0l4LOAZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYqr-00000004GbU-3NGH;
	Fri, 06 Mar 2026 17:20:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYqq-00000004Gan-0Q8r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 17:20:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77BF743A00
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 17:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57E06C2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Mar 2026 17:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772817635;
	bh=GhclToYLpG+7UMFBLf2ZmC1LGWDj2lllBQ5Rm1+HHeQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X0QuKWwIKsmDcGnlrpUm6yB2pihXgA6QnYd8IUEibiHrSNuEYsufpgaFky3ft/E3x
	 +k8gLScehB45uN8ll2nCrg5MFVG5cOFzng7aczmmuJ5UPzAPDrkBxJMFeNJSdAx519
	 4glCNghhsAObrjBqFZypUFPzqllh7KiwB+xoPuJkuzsdgnjT1nsaoASrVs8OgX7q1U
	 n9Uro5kGEi84Fod/pkVvc1TpFDLWICaWPjxCVGLbe85A1jY0tzAQCdn8i50MQZeObX
	 apByZC9DaB8qvVYwrGuaci2xaYMI0+UVEcIcRptuZD0LUK7vw+EgyePqCRkDzbPKQA
	 BCoheQn++AkqA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38a3486419cso19210191fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 09:20:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUxpBWA9RVL9jHpL9ACYvmMcdXKuf/XY0PzggORcREvufFEQc9Me9MXlGVew+rPCBrn+UVX+eXyp+cpY02qj/Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxQNgiwDOpHI1q0tjpAyoDXTGPT74BGneKu4W8c6bmq57Ng2OYJ
	9f/C5A/uvI1r7e887ZPhI2Ooa8ElyhSyUlShrr57omoH8d+zN7Tnrl6zj04AJB0RFjUG32yoftD
	wg88bHF1wysGIjW4bN4Ui901S+hyOJGavdm6bbjWHBw==
X-Received: by 2002:a2e:8a96:0:b0:386:8f97:d0b8 with SMTP id
 38308e7fff4ca-38a40d909b6mr9281811fa.20.1772817633825; Fri, 06 Mar 2026
 09:20:33 -0800 (PST)
MIME-Version: 1.0
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com> <aaFfEsfh0xTh0b1y@shikoro>
 <aaFsZbiLYSz_YEjw@hovoldconsulting.com> <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
 <aaHI_VavZugXjVoL@hovoldconsulting.com> <CAMRc=MdKF29McBJ9U=qELkzf9GYV1CQpRF7U6OweDNtVzMXo7A@mail.gmail.com>
 <aacE-27iaYneKCJi@hovoldconsulting.com> <CAMRc=Mcx8Hu407arSEo3o-Xhmep_ZK4BM2TVi_55nXGwYcaijw@mail.gmail.com>
 <aagSewpM88KAZDcJ@shikoro> <aar3rj7Db6NmTVS_@hovoldconsulting.com>
In-Reply-To: <aar3rj7Db6NmTVS_@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 6 Mar 2026 18:20:21 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mf5Ydt1JmaC63B-3wGXdLdYvE4jHhzD36t=PUTzuWfw2g@mail.gmail.com>
X-Gm-Features: AaiRm53pekvMkksI4fYGSCWmOvo94JFARCgE7Q2uLvo1sVDayAaQxKa6carQHj8
Message-ID: <CAMRc=Mf5Ydt1JmaC63B-3wGXdLdYvE4jHhzD36t=PUTzuWfw2g@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Johan Hovold <johan@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-actions@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_092036_156364_6F3D6B9A 
X-CRM114-Status: UNSURE (   8.44  )
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

On Fri, Mar 6, 2026 at 4:50=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>
> Bartosz seems to agree that my suggestion to decouple the driver data
> from the i2c_adapter would be better, and I'm willing to do the job.
>

Fair enough, I'll leave this for a couple of months then.

Bartosz

