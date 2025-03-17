Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826C1C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 18:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EnTcDDxnlcu92lmsvpNmrd7wbvCxZ/y02TWD+ryTtug=; b=eBn7OOIaV0h+UQo/8yMGoiCwOD
	FNREiFxHDlEkZZfzTa0xNBkKi00NP2MMytYfVrk3il5v+bujHtTc6Mqd+xSSy9Ow0+qvvmVc1zwan
	zywSrxV77qngzGS52fgB4M0JqsAe/pcdlBPJMay/UajNKkFPAtrXFNjMSGlINEoL1jv/0qNX95l0h
	sE3QyDTpE5RJkd3R0SHmshy8+ffjlWvgh/Z72Mb992ZCz1CfdHeXf4/mF7rYdy2W+lhnZu1pnHVB1
	sthLo+wxFm6b1vPgxikAqWWHais6QLAj42VWjfCblOGZGWrDfQCLegqJONyKiTys5ZZ4ZQIXw/ZhW
	91KoNzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFMo-00000003in6-0orX;
	Mon, 17 Mar 2025 18:39:14 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFL6-00000003iVN-02RT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 18:37:29 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso1577365a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Mar 2025 11:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742236647; x=1742841447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnTcDDxnlcu92lmsvpNmrd7wbvCxZ/y02TWD+ryTtug=;
        b=pr7CSMFMWSwHic7s5lmVc/ehKCR8nvxgF5UvOnCceAiw+CDVguQxWIRMLDt+dsXQPu
         Uh58kQKKcpjWtN35zfA6uLxTCL1160ZewZT53Wf4RyvyzyyPQeBz2SiWfpWHm1XiCDCm
         YP5obZ7zvI31GHAXYjk1VZ44PrijAEqZ21ybMDffu5nochgVU5+DAVGJZr7Ly6qnAffZ
         EC0j6UW71D2Efmjq0C2GHNT86WmcFUELakkIdJbY1vao3kqvEmQQhmwR0asS35CaFtMG
         PB4L/pab+3Q2tcLJLtUMMqJjIjfHwYUmtxqhPZaYBDqpnpBLwTNZnT44dWaI9L6LqUj2
         i+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236647; x=1742841447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnTcDDxnlcu92lmsvpNmrd7wbvCxZ/y02TWD+ryTtug=;
        b=d+yzBRscH1kpE/3wsW+bSz3JPz3B4E5Dgu3ewwLX82YipnL67DlzQYuj8XsJCFtbAn
         VxjIpaLSVrBqMrUiVKsLZBzyvxgqGRtT/WfInNokGFm6UJH8nMO9t8mh5kfLEBAoMUgk
         ogcaeH7WOKI7VDHbI9bD6C6QmhZhy9yodH5SUOAL+PUMy/qdz6+yxKfQna8MCYt1+41+
         DJpzt8Swsenq4l9H3++6qKVYiqT1UVrQMUhU74I/hExG6JMYYH+zzqOT6ezvNCEPNNRA
         l7FCbJd6s3N2aKGrNIao7ahfCXv56sTB3E+q0qzl7U9a9eFOYYGQ+XPPzJQhLqxDZVQV
         zdiA==
X-Forwarded-Encrypted: i=1; AJvYcCUyg4lzcAnkFp1/nZysttIS7KM68H81ZouUAumT9qy6Y9N5Md/vPfhl73MGR33vZkLA7iP5An+S8jT6HJtowoVd@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy+bSyOiKZMNIaR7vruX6b9LwyGR//1X6rwpZBmbvQ8yAue4iD
	2+NREsRNbfdnHx4Y4uLeYlWUag7p4S1NXG/8qmc5+e1K24S7g295dWmGmcQ8PS/1lM8jzh92uRj
	52CdtWJmkYdalxAi2KkcjRVuTzmLlvs7E/7A2lA==
X-Gm-Gg: ASbGncuXt/rNZjY5igUKONM5komL72S0FKL/jaCpr3E9V+8k+TOmjMIZ0BK6lYlckqT
	OCJ+fZWz8cr0EcMB4l19ZWY9en0Pcl8umdFch7eGeHvMJYcwFQw7wo2BjyNCOc4YEfEFcROr4GH
	hKZ71vmqrkGqvvAmeihxiQA2DAdpvwDR3FtCE/JQ==
X-Google-Smtp-Source: AGHT+IEhoXE3G6cQ5PsnTmHbL5R88MWeJjXOzzkHY7nsry3gktOpZ2t5U93aL61v6oxrZzlHHYJm0XVXQXeQDtBLhAg=
X-Received: by 2002:a17:90b:1807:b0:2fe:d766:ad95 with SMTP id
 98e67ed59e1d1-30151cd2f55mr17924347a91.9.1742236647100; Mon, 17 Mar 2025
 11:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <7hcygyb3yi.fsf@baylibre.com>
In-Reply-To: <7hcygyb3yi.fsf@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
Date: Mon, 17 Mar 2025 11:37:15 -0700
X-Gm-Features: AQ5f1JpIDMTdEuLdnoZ9Sgoh0AJoi8JyKOnu1RuLyl2dlsvLYLw5n8ugF-DlDxU
Message-ID: <CAOi56cVkwwsRQo-KQbME-Nmc2HemjmFEDn4_oaGcg9Te_MU_hg@mail.gmail.com>
Subject: Re: [GIT PULL] arm/omap: drivers: updates for v6.14
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_113728_048721_B01D59C3 
X-CRM114-Status: GOOD (  12.26  )
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

Hi Arnd,

On Tue, Jan 7, 2025 at 3:26=E2=80=AFPM Kevin Hilman <khilman@baylibre.com> =
wrote:
>
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b=
37:
>
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git ta=
gs/omap-for-v6.14/drivers-signed
>
> for you to fetch changes up to 6ef4ea3c944b9fc5d78317d1172cdcd10f9724f1:
>
>   Input: tsc2007 - accept standard properties (2024-12-10 16:17:30 -0800)
>
> ----------------------------------------------------------------
> arm/omap: drivers: updates for v6.14
>
> ----------------------------------------------------------------
> Andreas Kemnade (1):
>       Input: tsc2007 - accept standard properties
>
>  drivers/input/touchscreen/tsc2007.h      | 2 ++
>  drivers/input/touchscreen/tsc2007_core.c | 5 ++---
>  2 files changed, 4 insertions(+), 3 deletions(-)

It seems this PR was missed for v6.14.  Could you still take this one
for the v6.15 window?

Thanks,

Kevin

