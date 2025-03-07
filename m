Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EC5C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 23:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvlQKLrSiuf2/LahHmulAvjGAEyNjmerVi/1M7Kc3Yc=; b=NiC5M8i94shpTfW2UqRw/EvTFD
	AxR7WlLIPe3mpEfGkakxqN5kXu3cuux/5uzeEh89yDyG8dNivK8RZ+qdfDgYZOemOLGnextJORKTd
	mcEoqtLJEIlQkAvipP9cIYz8S3CkgNE/qX8Sfyl/4Kz1C5WEwGk0HGK/Dm9skCqXRS3HE/5C0erfr
	Wt7JNl82wcgHhVo2pY4PYLpsYMqWrbqDcuTqFRkI30fBG2tlR0/bWhVvS8t4qoobHUs3mDtnp2aBs
	aB3BAqsqn96FM+uR7CvDew2KA9cf36zMxitNfDess9M7RPEXtyJAcYS0lOGjWCH8ogV+w0gJsh+Bt
	pg/j42tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqgvs-0000000FmV3-418Q;
	Fri, 07 Mar 2025 23:16:44 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqgtt-0000000FmBk-44jd;
	Fri, 07 Mar 2025 23:14:43 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6e8f43c1fa0so24175676d6.3;
        Fri, 07 Mar 2025 15:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741389281; x=1741994081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvlQKLrSiuf2/LahHmulAvjGAEyNjmerVi/1M7Kc3Yc=;
        b=QluI+NYwH8N3ulXl3k3JUf4+Bxmgr1YK9Hy8hbADgoNcZvTLBFv8xbResxpI8mKMrR
         p8WMIl3itl1D2V+mpLXWp/+VcFjA9jCIrPcdtAOfMWMs5aBrRYP/HWSx4kveO7TZG5PY
         t7sqHqraqo5lLgdTUv6V4W8EI4kTMb2vMVN/LuKAbjLDpumOtdoKEEoemIcbuUJu7kLh
         smZ2FV51MBTNDQm9h5TMVA3Iw+jRnYUF+FVTvj8YI9Cpau2Ui33R3S7VJ2R1dNqdZD/L
         +HARJRRUnr+8QXTXRKpRTuQ/eUd3hSAYEVCzj29gf9woDb8tMtGEo7X4D7RKRw/9CQ19
         AW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741389281; x=1741994081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvlQKLrSiuf2/LahHmulAvjGAEyNjmerVi/1M7Kc3Yc=;
        b=THvV3fkc1ubwFXMlbR5sZWdcvXE/7La2U1Tuu9kMT4fMoPqcgPC2ygV+QVkOm42jJ0
         x6H7J6DpqQVmQjuMtLCL+s6KL+IV8Pj3KYDxJbb3DuTHUGvo+orWFzk+IpTkHRfYnSoy
         kBxLWLGllkD8p9eMJ3IpMa2uAnZMNzg/bBjWMojWbybh114Mm4BL9XXU73rvz4c4WjlY
         42woTT+8x3xGkWLl8P7sqog+r9bQk/vQVR+jTrZXa8Jfmtl71FlbTAQL5jNeLZlAghYW
         UWQFIKE47XGZ0ZHj8tmAFgmL/QZXYtOfytvxn5XuixC9/3rJISTEfZKPdtR+xslhglzx
         DI4g==
X-Forwarded-Encrypted: i=1; AJvYcCX24AyphdZYKQ3A9hywNdwBuDxh1nLJer71+OZ/sFh3hoJW7Q5qww4lRkd/VJtGuZq8YMjRVGU1Btn+N5oieBRw@lists.infradead.org, AJvYcCXJgCj5YjtT96N2ynCpTRTcCcylksPGbN/0lzunFWqtSzM3BqGt4uS217QO6hy6plbFtNq6FVJbWXYLnxY8kA8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp/hlp3abxZeWsObENEahPTJonzmnVmsE0k2XX4vzV32kNOtm9
	DBA9WnSqJsGSblzHJPIXf8XdyvUubSNGhimHummVpCFXqvcb/BbdHVpwN5spLYZpci+G9LkKxwR
	uSbbNXKHtmkfp2Utz7A8oXdG64ZQ=
X-Gm-Gg: ASbGnctEuk9VUms/j4dsD9Nnn2vD36vSJKySJJHA3y0oElO9mh6mLt4R+FgKIb+RBA+
	eL8/5fzfCoB0rdKzRDvr5HVYMmkhGRE3a9n0n1rUZtetNKn6ulGF1u0Lknmym5QqPJ0e+d0RH6q
	2I9zOCwqim39UHNb6JRRyNL5aKBXeEsHt4JsBDgkZ67Q==
X-Google-Smtp-Source: AGHT+IHWYEQ6LscglzBgawkGRiqBX2sOTVaS0nueKi1A4ZzRN9eK4g2H4WB1UETzJEMeMek/KVtF2JUfl6jDtMtPy88=
X-Received: by 2002:a05:6214:76c:b0:6e8:fa7a:14ab with SMTP id
 6a1803df08f44-6e9005b6618mr58352686d6.6.1741389280497; Fri, 07 Mar 2025
 15:14:40 -0800 (PST)
MIME-Version: 1.0
References: <20250307120141.1566673-1-qun-wei.lin@mediatek.com>
 <20250307120141.1566673-3-qun-wei.lin@mediatek.com> <CAGsJ_4xtp9iGPQinu5DOi3R2B47X9o=wS94GdhdY-0JUATf5hw@mail.gmail.com>
 <CAKEwX=OP9PJ9YeUvy3ZMQPByH7ELHLDfeLuuYKvPy3aCQCAJwQ@mail.gmail.com>
In-Reply-To: <CAKEwX=OP9PJ9YeUvy3ZMQPByH7ELHLDfeLuuYKvPy3aCQCAJwQ@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 7 Mar 2025 15:14:29 -0800
X-Gm-Features: AQ5f1Jo_UNIHhJUaEMGqM4jtD6PWvuZ_dX8aqKe0wEkynddQGZ-ujq2FDrA5W-U
Message-ID: <CAKEwX=MtzM4Vw221pHTj8CZJ1NhLgo7Ls3xroxLRO399fzG98Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] kcompressd: Add Kcompressd for accelerated zram compression
To: Barry Song <21cnbao@gmail.com>
Cc: Qun-Wei Lin <qun-wei.lin@mediatek.com>, Jens Axboe <axboe@kernel.dk>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
	Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chris Li <chrisl@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Kairui Song <kasong@tencent.com>, 
	Dan Schatzberg <schatzberg.dan@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	nvdimm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Casper Li <casper.li@mediatek.com>, Chinwen Chang <chinwen.chang@mediatek.com>, 
	Andrew Yang <andrew.yang@mediatek.com>, James Hsu <james.hsu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_151442_009701_230E9BA0 
X-CRM114-Status: UNSURE (   8.07  )
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

On Fri, Mar 7, 2025 at 3:13=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote:
>
>
> Agree. A shared solution would be much appreciated. We can keep the
> kcompressd idea, but have it accept IO work from multiple sources
> (zram, zswap, whatever) through a shared API.

by IO I meant compress work (should be double quoted "IO"). But you
get the idea :)

