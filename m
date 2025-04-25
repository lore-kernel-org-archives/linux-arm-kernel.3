Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24590C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFMfmyje2Ay7PUB1MUIQLu/sa8uRRcfjUmehOtjPqDY=; b=cVz7x4wKJZoZQCf1bYMcQoJO/6
	wFbMsDSA4lw5LHQcArA56UVz092p6a+ritea00Ux7i+XkoUbVcHUh6XBNGWKLENQFo3mM9JhkxwEQ
	URIkPDnHVcIbvkpiWs54rk+GNb6CY+t+F2tpBsh34+Croq4/WxZBLBJNd05UVMLOFCku33Rn2RCol
	lBpAD+mjOQNUHPeMIclzz+d5UyttDK4Yx+uUEdZLz6xVxDfygHgYdysZBTCpBhamjSn5/90KC9rHV
	qVw/MlqSgPnmG1d1zhw7CcJk24UPwnxzF1S68cGXeRjLYrKqKx62N2QRhMCdyFa4d8bTf+HA7DWA+
	VpaLtypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Lz3-00000000EVv-3GFQ;
	Fri, 25 Apr 2025 16:33:01 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8KwB-000000002Oy-0UJG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 15:26:00 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7394945d37eso2128073b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 08:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745594758; x=1746199558; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SFMfmyje2Ay7PUB1MUIQLu/sa8uRRcfjUmehOtjPqDY=;
        b=XPUdMzkJKWx0NHoQ127P9cgXviTBkNP+iG5PQWs41cwHbLQ1FOeNmE0VsMqmhh+eHi
         bJTS18mXr1N/VMQFatcbeaqRjLJOuhtvXbvejc8/yFX50YLQeJ04x3QYySYee+SXQm7p
         ma8EEp1DzNmw9GDlybNv018zIRVBZWuz9OwkWe1n+whV3Rp3Rdtq1pK7DH5SeJq8Cf5P
         6gKtIzvqlSv7bmQ6ulCOU1Uz9YqqyknOL6QDaMQAs5ofv7N6KftRepP9KqtayR7znrgP
         uwKDsuxErmvVucHzIUpzZX/4H61f104CfrAsxI6YmVgodDoO8Gv5xG0a64MKAm7RZInB
         pGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745594758; x=1746199558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFMfmyje2Ay7PUB1MUIQLu/sa8uRRcfjUmehOtjPqDY=;
        b=AWxwac3qF/KjGrZjRr+WHsjJzxyS/xCA0otfY96MFgWPfq+305vVwDSUcyKBKDxfsw
         mNeIqUAShLBSCOZvkCWLgKPO+3Iysrfk6T7hsfTTpxRKN2CbXpd8m+EDe4nVq6JRyyov
         l9RujBzb3oCf+4pXbu8w1w1UZbXMtC4pf/4ZNk5WBC/FyEFIFI5ArYIagPxZaUcFtBvc
         MdUSEgcqcgTrtMIh+h4F7EDRcY4kyCXhjvAS3D/S+0NCV49ig854IsK9h6rtBJZRvI+s
         jnw6/16wARP/aFAClmyKItPiXCRw51jLH2mn2xhMt7cmonrVSg1Q06ElN/aN9kAu1Cnz
         OIQw==
X-Forwarded-Encrypted: i=1; AJvYcCXjxLOh3ch9nl8Br/LXeg/YfGdnGnIHzZIOULxWU7MOYiKfUk9aI4heyOW9ocjnXCRBumZ7c0DptI5p7LkyAIoY@lists.infradead.org
X-Gm-Message-State: AOJu0YwXAV0v0XX5fuOwyUEUuv2RP4tU+rQBP/V7BMQ2ZW6YFaQ6iEUR
	vkNwXqtDzcMXIgFCOzJ3B7i+Pmbq9S8G8uQvpfr6GSZJexgaobiRqHab6AKDWrTsmtr0pMKDSgN
	7Grp0L+nDhKmBmXY9/eAvUsUmhs8CmjnjTjex+w==
X-Gm-Gg: ASbGncv9j7Hp0/uRsC/1dB6uVShR8rvGli+OeZy5hwxh+ob3gtJqrBonhwtF3+onnRS
	kguJ6nHtrUpLugPQ6DghZf18Ti4ak/nIdxNq3LY17VOci3qdDX3c4gletBIIS/H8gNu0WLgsXJU
	ktRUVZUFUuY0QIrhd/8ffFbVIdsoNN6CDqVRr6cT5DUrriA4pi7JqCGfM=
X-Google-Smtp-Source: AGHT+IHZt/PvL0IYviSGWGwys58uHHU/qyJ3mVkVbS0ImrXbA+M9ZGv4a48+hBPrudXzjwRv0uMRYoHDKa+TdE0Dyk8=
X-Received: by 2002:a05:6a00:18a6:b0:736:ab1e:7775 with SMTP id
 d2e1a72fcca58-73fc7b51460mr3994796b3a.0.1745594758219; Fri, 25 Apr 2025
 08:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250408195922.770377-1-yabinc@google.com> <20250408195922.770377-3-yabinc@google.com>
 <358f4a8c-29ad-4e5e-91b9-063f06e769ec@linaro.org>
In-Reply-To: <358f4a8c-29ad-4e5e-91b9-063f06e769ec@linaro.org>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 25 Apr 2025 16:25:46 +0100
X-Gm-Features: ATxdqUG1fmyZ5-PKnBFr3vozBSaptLAsvKtSFIiRksEvaZt8vaft2LpISC3dbm8
Message-ID: <CAJ9a7VigiBrcenP9w84KS21iE8gnB7bGC9Q6ZFF33ZHveu9SEg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] coresight: core: Disable helpers for devices that
 fail to enable
To: James Clark <james.clark@linaro.org>
Cc: Yabin Cui <yabinc@google.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_082559_153607_0BF0D8CC 
X-CRM114-Status: GOOD (  23.86  )
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

On Tue, 15 Apr 2025 at 14:51, James Clark <james.clark@linaro.org> wrote:
>
>
>
> On 08/04/2025 8:59 pm, Yabin Cui wrote:
> > When enabling a SINK or LINK type coresight device fails, the
> > associated helpers should be disabled.
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-core.c | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
> > index fb43ef6a3b1f..a56ba9087538 100644
> > --- a/drivers/hwtracing/coresight/coresight-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-core.c
> > @@ -486,8 +486,10 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> >                        * that need disabling. Disabling the path here
> >                        * would mean we could disrupt an existing session.
> >                        */
> > -                     if (ret)
> > +                     if (ret) {
> > +                             coresight_disable_helpers(csdev);
>
> Hi Yabin,
>
> Unfortunately coresight_disable_helpers() takes a path pointer now so
> this needs to be updated.
>
> I tested with that change made and it works ok.
>
> >                               goto out;
> > +                     }
> >                       break;
> >               case CORESIGHT_DEV_TYPE_SOURCE:
> >                       /* sources are enabled from either sysFS or Perf */
> > @@ -496,10 +498,13 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
> >                       parent = list_prev_entry(nd, link)->csdev;
> >                       child = list_next_entry(nd, link)->csdev;
> >                       ret = coresight_enable_link(csdev, parent, child, source);
> > -                     if (ret)
> > +                     if (ret) {
> > +                             coresight_disable_helpers(csdev);
> >                               goto err;
> > +                     }
> >                       break;
> >               default:
> > +                     coresight_disable_helpers(csdev);
>
> Minor nit, you could collapse these last two into "goto
> err_disable_helpers" and add another label before err: that disables
> helpers before falling through to err:.
>
> Other than that:
>
> Reviewed-by: James Clark <james.clark@linaro.org>
>
> >                       goto err;
> >               }
> >       }
>

Subject to James' comments -

Reviewed-by: Mike Leach <mike.leach@linaro.org>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

