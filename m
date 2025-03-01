Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B94FC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Mar 2025 06:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYsknFL9wn8TXyAoam6UhXD2HJ2W0Fat2/tzrcZZNvg=; b=4xKN1h9CJ3QxZncbLKeAC2f6+b
	Le9nJgLZg0lpObret98SEB6bIsEPy+/A/kN1arirn8vCby9OZOLQ4OUmAZCDBx4+WyDB1qKIuDc6e
	wwx1XWp1b9mtwtY9/H9gX6d6YdVB1QWuPz1AoyenjJWfsbB1fpn85Rt5O44SU1DJx5wOF+d1U68G4
	xoxCuiVYrPAZxHAhGpHLZyhjvFBq1IrvlZKa213vt1IxJ8vXUZpb9lXsQf3qNULrHK31tfNOduPqB
	+lBuQL1lM3yJgZ347W0viPhSMOuakNnzYfvIk23ovI1E12pQWExvVADG0VgWJ4SZvVD2uDBYH7suX
	roYoXzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toGbM-0000000DWTq-2SoZ;
	Sat, 01 Mar 2025 06:45:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toGZn-0000000DWO9-2Ekn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Mar 2025 06:43:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D76E95C4348;
	Sat,  1 Mar 2025 06:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FECC4CEDD;
	Sat,  1 Mar 2025 06:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740811434;
	bh=cpfdLDnv01K3lMmbWvGqTS+lBbMcEeQPx8Q2+PRAk6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VBCwc1LbLIfrWcd2iFWFdFCGkh25i+cvKkfjbHveyU1eRK0idLhodj1FF5WZ7d2pc
	 nZc6FQQ+j0HJyKlHwKt96vhEZB7/XJQpiX/y7uEnYhETIo8s9wWmP3VLBNUiQtkh4t
	 MkI0J5gDMdTspVZWZSM6Btg3dwJ/rDh3NM6I2hoD28vhlbnZaFoZd70o4mi1syvi/c
	 xJ5AIM0zkaZG0sz3WJyIaCVjAPiMu9njQk6enRDEvFAnt7o44RBHlXhPC2CsjGPEoS
	 /+j4wyainajsE/xtwbFKvy9xB3UIiJu7Sc4Pc0F9b5VQ+wn9E4AUX3MvCGNYw9I5ki
	 MtUFkpvUFGZRQ==
Date: Sat, 1 Mar 2025 06:43:49 +0000
From: Will Deacon <will@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, jonathan.cameron@huawei.com,
	prime.zeng@hisilicon.com, linuxarm@huawei.com,
	yangyicong@hisilicon.com, wangyushan12@huawei.com
Subject: Re: [PATCH 4/9] drivers/perf: hisi: Use ACPI driver_data to retrieve
 SLLC PMU information
Message-ID: <20250301064347.GB27700@willie-the-truck>
References: <20250218092000.41641-1-yangyicong@huawei.com>
 <20250218092000.41641-5-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218092000.41641-5-yangyicong@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_224355_627792_AE38B66F 
X-CRM114-Status: GOOD (  17.81  )
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

On Tue, Feb 18, 2025 at 05:19:55PM +0800, Yicong Yang wrote:
> From: Junhao He <hejunhao3@huawei.com>
> 
> Make use of struct acpi_device_id::driver_data for version specific
> information rather than judge the version register. This will help
> to simplify the probe process and also a bit easier for extension.
> 
> Factor out SLLC register definition to struct hisi_sllc_pmu_regs.
> No functional changes intended.
> 
> Signed-off-by: Junhao He <hejunhao3@huawei.com>
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c | 191 ++++++++++++------
>  1 file changed, 125 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
> index dbd079016fc4..c1fd60d397c3 100644
> --- a/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
> +++ b/drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c
> @@ -36,11 +36,14 @@
>  #define SLLC_SRCID_NONE			0x0
>  #define SLLC_TGTID_EN			BIT(5)
>  #define SLLC_TGTID_NONE			0x0
> -#define SLLC_TGTID_MIN_SHIFT		1
> -#define SLLC_TGTID_MAX_SHIFT		12
> -#define SLLC_SRCID_CMD_SHIFT		1
> -#define SLLC_SRCID_MSK_SHIFT		12
> +#define SLLC_TGTID_MIN_MSK		GENMASK(11, 1)
> +#define SLLC_TGTID_MAX_MSK		GENMASK(22, 12)
> +#define SLLC_SRCID_CMD_MSK		GENMASK(11, 1)
> +#define SLLC_SRCID_MSK_MSK		GENMASK(22, 12)
>  #define SLLC_NR_EVENTS			0x80
> +#define SLLC_EVENT_CNTn(cnt0, n)	((cnt0) + (n) * 8)
> +#define SLLC_FIRST_BIT(_mask)		(find_first_bit((const unsigned long *)&(_mask), 32))
> +#define SLLC_FIELD_PREP(_mask, _val)	(_mask & (_val << SLLC_FIRST_BIT(_mask)))

It's a bit of a shame to have to compute this dynamically given that the
input mask is constant for a given device. Is it not possible to use the
generic FIELD_PREP macro in per-device code and then just dispatch to
that, instead of funneling everything through hisi_sllc_pmu_regs?

Will

