Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4711CD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 18:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=73aJvT78EfmudBoNQebNxRMzgCqJqA0gYXVzx8cSYYo=; b=oJmTkh5jS5WQ93igJo0zPFfIBW
	OcauHieAJYof+MNYjC9/kB7t7exveEol1SlBIXkScBanI8RszCt29AlucQdDBcCHQ+gLS12RxyYTc
	KXd8xVWnv7x4oGPpQgNdsjT4eb2VePub8aB87BkddtEAluxr1PncPK0qQcL0mmx7+Lhn+87rsRvkq
	vcfVxLiU9YeMxBNNynknvIuoQlQP3EQo24XqYEPAwKyOYoWh1FzMEjz2aZAnpqJt4etvg4m3p7Y4P
	BMRzoohC70CYyDF+ZevY7dpAHo6ehA1Tpx7rURZEO7HWwzj7vDqkZJOP4YKFFyeEamEMAvFBJdcf9
	qePj4Gig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNb10-00000006Lja-3GPw;
	Thu, 14 May 2026 18:42:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNb0x-00000006Lj0-3gfI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 18:42:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 06F5F416D5;
	Thu, 14 May 2026 18:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C62A9C2BCB3;
	Thu, 14 May 2026 18:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778784150;
	bh=1wWm/PCkLcrcrXBO8q31VLvgXwZnf/NvvUr5rhg6BEY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aaS0hNdJYUgjq+fa4BNZJ5qB54d4fEZVhug5m3mkVxASwOnpyeEitdRETR1KlR/UV
	 snmb54+gVAXgsGMuDWRWCtnLQhKPhqkqTEDZJUWv2oUuBtSk4IulMScStvJhb98LWo
	 Frr+P3uhsFnf0nxMCfQbdr3ZCt/vmoLgTdim3lf7uSAthAPOg4sD8E+Z5mJVR4mo3d
	 CdxlgJRyYPodk7a9giw1sQzh5RmRvZIXEoDA/7zEuovSLa//CF0qSWMbZ4hN3yRoE9
	 m3mjOg+E9jIvwEuOMGfSAPa6YfPJ0/pLGq4j2HwdPXLnHNOJ5TZYPHiQOXVVh90283
	 WYRjhQY5mZHCQ==
Date: Thu, 14 May 2026 19:42:25 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Alex Tran <alex.tran@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Jyoti Bhayana <jbhayana@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 0/5] scmi: Log client subsystem entity counts
Message-ID: <20260514-generous-psychedelic-skunk-a56a02@sudeepholla>
References: <20260513-scmi-client-probe-log-v2-0-36607e9dd540@oss.qualcomm.com>
 <20260514164422.0eba9a61@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514164422.0eba9a61@jic23-huawei>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_114231_935019_B58954B4 
X-CRM114-Status: GOOD (  15.57  )
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

On Thu, May 14, 2026 at 04:44:22PM +0100, Jonathan Cameron wrote:
> On Wed, 13 May 2026 10:16:53 -0700
> Alex Tran <alex.tran@oss.qualcomm.com> wrote:
> 
> > SCMI client drivers do not consistently log the number of supported
> > entities discovered from firmware. This information is useful during
> > debugging because it shows which domains or resources were exposed by
> > firmware during probe.
> > 
> > Add logging of the number of supported entities to the SCMI cpufreq,
> > pinctrl, reset, hwmon, and powercap client drivers after a successful
> > probe. This aligns these drivers with the existing logging in the SCMI
> > power and performance domain drivers.
> > 
> > Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
> Hi Alex,
> 
> Just curious but why +CC linux-iio and IIO folk?
> 
> May be you had a false suggestion to add them from get maintainers.
> If so be sure to check it's suggestions make sense!
>

My guess, the intention was to add similar logging in scmi_iio_dev_probe()
as well, may have got dropped {un/}intentionally, but the list remained
in place. The author of the driver is also cc-ed.

-- 
Regards,
Sudeep

