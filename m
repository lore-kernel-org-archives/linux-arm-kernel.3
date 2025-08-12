Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9C6DCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wIcDLJkcC/4h4vpD3h9Md+aGM0+RgBKilVDmhk7f1DA=; b=rY39yHmAKlj/1ezVtKdIq3eZ+A
	JKhK3uGCCffFU2J7rJarNil5TMDoPPrnx+tjpm5sVLE1I+uQCALYsHLHQdeRP1+R7XE9NNloOeQGF
	7EvHsJCQ43KGKPgUEUTIdpluXM/i+uRFw9ZbK5x7GoMCnvGYk7TUDinBilwFoZu5474WfHd3WtCy4
	ZMm6o1gdo3/psKaBYgehUppFKf53gl1X4fFIhSeDlsWJspUapmfl+biBXc/qZBbe/N9engb0hNaXm
	sI5KD4/qrhMFWu+Qd4EgmJ5jf+MDBJwia3J7iGLizvjQRbuuBjDNgbQAb4SrgpEjOhE5kkW5JxgBd
	To8ebtMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrhu-0000000BHSa-1pUo;
	Tue, 12 Aug 2025 16:18:38 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulloq-0000000ASUO-3ZLb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 10:01:26 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-71a3f7f0addso50615057b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 03:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754992884; x=1755597684; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wIcDLJkcC/4h4vpD3h9Md+aGM0+RgBKilVDmhk7f1DA=;
        b=lShkZa3JCPp1i5CVwi0Pg5nQUazyjlKzX/QOwYU6CJZcghSjug3459tL58PrxYkaKL
         S6QTexVHan72vXfkT/ozL9P9SMZRW8kdHN9srPz/BTd+rHWdoOlDbuMCPJrUuwJXxahs
         B6imoxfTZ9BKBwyyTprFscWl1JYz7Yeg5nc404ogaIAyExCAIOjvEmHh8a2YIMiBnmLM
         9To5OjtttEk+sIjS5vBI3oaelF4wP7q2Gjvn7NXPuADMogLvte1+0Q7ozkAefuEM0NDO
         ly/zfapWv9te02O6WFp/8/QSnHvRv7EI8cMa98bXTaRPoh+0bcMQgj9WjAbGzXyXi3Po
         1F/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992884; x=1755597684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIcDLJkcC/4h4vpD3h9Md+aGM0+RgBKilVDmhk7f1DA=;
        b=DR2wJJF0N4Wa9fjOSD01gaV86h7Dm1pu0b7yEECaLrpIH48RTVE7AX0HY0yo6zw3Ck
         PYtEMp5szmdHGy4UdGkqXjPyyF1blvDUe03JW2PxPCp9jGdTdK/ex9kAjfDy5m1kKLRe
         fcnkmL9l49es51n8kY3SVl0zPpK23uzU9nofKs5S3vDXdPVUSEgm9tmJ4v4gWJvf4G2f
         BtvX9fIWQ9utsV0xy21FmKiZpJSTsz4h8kCw5JsxVwjanHEgrIUsHsS729CLa5u4fJoc
         9PYoHlsHRZIAN/5Nwq1SCrYzqKQ2vNazNTvQb62J5Z3NmeA9yOMbD8stXiY10SRjVcLL
         h0eA==
X-Forwarded-Encrypted: i=1; AJvYcCVUIPTqpvdQ+lQJTXuyKWw8M3Dx/rcrO8TeF76gItk+y1Z/D8BPf0WuJLBeY7iVTbjGmEKcLGFNUvDOlEBmx/7h@lists.infradead.org
X-Gm-Message-State: AOJu0YydxFiLzjN2dbhqrfWEQms3B/9doJZ7VGXk56bJLldaW4B7up+L
	vDOAml09XPgGwkiT3oaxJEWlCop5l+3eQfUFwxPqmQwZb652Gpv/e9ei8pnf0ET3mCDKBkBLN3V
	xnIiUy0OKBVXzLrq+/eb9dzuQcWX4Xsd9ZY5PHFW9ZLISkMM00NgWrfM=
X-Gm-Gg: ASbGncsraJdivALH5BFfivSpSZKvSqSsyfi/BkX3+GJjqYtS90e7dOnnz+KSVvGUa/1
	gjFzC1LXlEt3f4I1OnET24iWHLqcuejJeiX0Bdi+TRuxWWllJ5LFjJarSKDFwDg5PY3Ka7Omp3w
	7m5Oee32wH76RPLHhJd/VZaFchsQeuPSR9g44sXf1lT5QoAMIAh1e/Um+ihcEYg0w7eaRzCRuvz
	Is0X3bc
X-Google-Smtp-Source: AGHT+IH+kgYcIU+KIQofto2+FJUD73uoizAVljhEzlAHBsS06NuOjMp+vsz1mWGXO8RJi58Vv7ybYaDk6l97P7frFRA=
X-Received: by 2002:a05:690c:4b93:b0:71a:34bb:4277 with SMTP id
 00721157ae682-71c429b0643mr35302057b3.18.1754992883651; Tue, 12 Aug 2025
 03:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CAPDyKFr=u0u2ijczExkntHK1miWZ6hRrEWBMiyUwShS3m6c29g@mail.gmail.com>
 <CAMuHMdX1BacUfqtmV8g7NpRnY9aTdL=fh+jC7OryMLz4ijaOCg@mail.gmail.com>
 <CAPDyKFqANQZmGXd8ccA5qWiGrCor2N=W_7dmV+OK8hMd_+zmmw@mail.gmail.com> <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
In-Reply-To: <CAMuHMdVrkr56XsRsbG7H-tLHVzmP+g-7=5Nrv9asC25ismwiYA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 12 Aug 2025 12:00:47 +0200
X-Gm-Features: Ac12FXzfiqHB8h5pg7wGWT0OcU-UbYb0hngDXruGLnrHgo3vA-Bxi3AW8WYY6Fk
Message-ID: <CAPDyKFq7z9e9hEC9QWiYcaU=t+Gs_GgRurmK-+cNYp4xkhr5Ow@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] pmdomain: Add generic ->sync_state() support to genpd
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_030124_920455_651E1D9A 
X-CRM114-Status: GOOD (  58.83  )
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

On Thu, 7 Aug 2025 at 11:38, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Wed, 30 Jul 2025 at 12:29, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Wed, 30 Jul 2025 at 11:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Wed, 9 Jul 2025 at 13:31, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > On Tue, 1 Jul 2025 at 13:47, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > > > > Changes in v3:
> > > > >         - Added a couple of patches to adress problems on some Renesas
> > > > >         platforms. Thanks Geert and Tomi for helping out!
> > > > >         - Adressed a few comments from Saravanna and Konrad.
> > > > >         - Added some tested-by tags.
> > > >
> > > > I decided it was time to give this a try, so I have queued this up for
> > > > v6.17 via the next branch at my pmdomain tree.
> > > >
> > > > If you encounter any issues, please let me know so I can help to fix them.
> > >
> > > Thanks for your series!  Due to holidays, I only managed to test
> > > this very recently.
> > >
> > > Unfortunately I have an issue with unused PM Domains no longer being
> > > disabled on R-Car:
> > >   - On R-Car Gen1/2/3, using rcar-sysc.c, unused PM Domains are never
> > >     disabled.
> > >   - On R-Car Gen4, using rcar-gen4-sysc.c, unused PM Domains are
> > >     sometimes not disabled.
> > >     At first, I noticed the IOMMU driver was not enabled in my config,
> > >     and enabling it did fix the issue.  However, after that I still
> > >     encountered the issue in a different config that does have the
> > >     IOMMU driver enabled...
> > >
> > > FTR, unused PM Domains are still disabled correctly on R/SH-Mobile
> > > (using rmobile-sysc.c) and on BeagleBone Black. Note that these use
> > > of_genpd_add_provider_simple(), while all R-Car drivers use
> > > of_genpd_add_provider_onecell().  Perhaps there is an issue with
> > > the latter?  If you don't have a clue, I plan to do some more
> > > investigation later...
>
> of_genpd_add_provider_onecell() has:
>
>     if (!dev)
>             sync_state = true;
>     else
>             dev_set_drv_sync_state(dev, genpd_sync_state);
>
>     for (i = 0; i < data->num_domains; i++) {
>             ...
>             if (sync_state && !genpd_is_no_sync_state(genpd)) {
>                     genpd->sync_state = GENPD_SYNC_STATE_ONECELL;
>                     device_set_node(&genpd->dev, fwnode);
>                     sync_state = false;
>                     ^^^^^^^^^^^^^^^^^^^
>             }
>             ...
>     }
>
> As the R-Car SYSC drivers are not platform drivers, dev is NULL, and
> genpd->sync_state is set to GENPD_SYNC_STATE_ONECELL for the first PM
> Domain only.  All other domains have the default value of sync_state
> (0 = GENPD_SYNC_STATE_OFF).  Hence when genpd_provider_sync_state()
> is called later, it ignores all but the first domain.
> Apparently this is intentional, as of_genpd_sync_state() tries to
> power off all domains handled by the same controller anyway (see below)?

Right, this is intentional and mainly because of how fw_devlink works.

fw_devlink is limited to use only the first device - if multiple
devices share the same fwnode. In principle, we could have picked any
of the devices in the array of genpds here - and reached the same
result.

>
> > > BTW, the "pending due to"-messages look weird to me.
> > > On R-Car M2-W (r8a7791.dtsi) I see e.g.:
> > >
> > >     genpd_provider ca15-cpu0: sync_state() pending due to e6020000.watchdog
> > >     renesas-cpg-mssr e6150000.clock-controller: sync_state() pending
> > > due to e6020000.watchdog
> > >
> > > ca15-cpu0 is the PM Domain holding the first CPU core, while
> > > the watchdog resides in the always-on Clock Domain, and uses the
> > > clock-controller for PM_CLK handling.
>
> Unfortunately the first PM Domain is "ca15-cpu0", which is blocked on
> these bogus pending states, and no PM Domain is powered off.

I see, thanks for the details. I am looking closer at this.

In any case, this is the main issue, as it prevents the ->sync_state()
callback to be called. Hence the "genpd->stay_on" will also *not* be
cleared for any of the genpd's for the genpd-provider.

>
> If I remove the "sync_state = false" above, genpd_provider_sync_state()
> considers all domains, and does power down all unused domains (even
> multiple times, as expected).

I think those are getting called because with the change above, there
is no device_link being tracked. As stated above, fw_devlink is
limited to use only one device - if multiple devices share the same
fwnode.

In other words, the ->sync_state() callbacks are called even if the
corresponding consumer devices have not been probed yet.

>
> Upon closer look, all "pending due to" messages I see claim that the
> first (index 0) PM Domain is pending on some devices, while all of
> these devices are part of a different domain (usually the always-on
> domain, which is always the last (32 or 64) on R-Car).
>
> So I think there are two issues:
>   1. Devices are not attributed to the correct PM Domain using
>      fw_devlink sync_state,
>   2. One PM Domain of a multi-domain controller being blocked should
>      not block all other domains handled by the same controller.

Right, that's a current limitation with fw_devlink. To cope with this,
it's possible to enforce the ->sync_state() callback to be invoked
from user-space (timeout or explicitly) for a device.

Another option would be to allow an opt-out behavior for some genpd's
that are powered-on at initialization. Something along the lines of
the below.

From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 29 Jul 2025 14:27:22 +0200
Subject: [PATCH] pmdomain: core: Allow powered-on PM domains to be powered-off
 during boot

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c   | 3 ++-
 include/linux/pm_domain.h | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 0006ab3d0789..ef0760824c92 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -187,6 +187,7 @@ static const struct genpd_lock_ops genpd_raw_spin_ops = {
 #define genpd_is_opp_table_fw(genpd)   (genpd->flags & GENPD_FLAG_OPP_TABLE_FW)
 #define genpd_is_dev_name_fw(genpd)    (genpd->flags & GENPD_FLAG_DEV_NAME_FW)
 #define genpd_is_no_sync_state(genpd)  (genpd->flags &
GENPD_FLAG_NO_SYNC_STATE)
+#define genpd_is_no_stay_on(genpd)     (genpd->flags & GENPD_FLAG_NO_STAY_ON)

 static inline bool irq_safe_dev_in_sleep_domain(struct device *dev,
                const struct generic_pm_domain *genpd)
@@ -2392,7 +2393,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
        INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
        atomic_set(&genpd->sd_count, 0);
        genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
-       genpd->stay_on = !is_off;
+       genpd->stay_on = !genpd_is_no_stay_on(genpd) && !is_off;
        genpd->sync_state = GENPD_SYNC_STATE_OFF;
        genpd->device_count = 0;
        genpd->provider = NULL;
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index b9d3c7d5c4f8..61b81574efc4 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -109,6 +109,12 @@ struct dev_pm_domain_list {
  *                             genpd provider specific way, likely through a
  *                             parent device node. This flag makes genpd to
  *                             skip its internal support for this.
+ *
+ * GENPD_FLAG_NO_STAY_ON:      A powered-on PM domain at initialization is
+ *                             prevented by genpd from being powered-off until
+ *                             we receive a ->sync_state() or runs the
+ *                             late_initcall_sync. Use this flag to allow
+ *                             power-off without waiting for these conditions.
  */
 #define GENPD_FLAG_PM_CLK       (1U << 0)
 #define GENPD_FLAG_IRQ_SAFE     (1U << 1)
@@ -120,6 +126,7 @@ struct dev_pm_domain_list {
 #define GENPD_FLAG_OPP_TABLE_FW         (1U << 7)
 #define GENPD_FLAG_DEV_NAME_FW  (1U << 8)
 #define GENPD_FLAG_NO_SYNC_STATE (1U << 9)
+#define GENPD_FLAG_NO_STAY_ON   (1U << 10)

 enum gpd_status {
        GENPD_STATE_ON = 0,     /* PM domain is on */
-- 
2.43.0

Kind regards
Uffe

