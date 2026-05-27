Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5769CD6E41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 09:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lsDJxsAGEUKL7x2JdAqJaXeFTmSS7Lvd5bf6pE+FYbA=; b=xV8oorbfL+IzCAmFNkbjHCT9+d
	hOJCrd2X+vZvpT7xnqVLdvUKTb4MUZFtAujnp/27v9M46RAH3PaLH4l1i5hCeqneWrZtqwTVXwpzY
	jzfggApQt9949M0RFn//H1/rBaXxMhEPSDSPT+3V7b86Zinf27lWglZ1mq+AqdO64GOf6FLHI9x9P
	NcfNNUuEhFpbcG3jqt1EEJDNBlzLhDO3JeXORctj3bKjZiB32YWyQLTXBJbWVcHa2zKiWGLwofqPi
	xMVDmnn/e6ZrV7V2Z8bohF1W/xqGlwHC098MQ+YhFqWFKRwwBQkQflNtqUTkEAnuMJnN+F+OlQeCo
	McaZmB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAfK-00000003egS-3Hwv;
	Wed, 27 May 2026 09:35:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAfH-00000003ef1-3WZr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 09:35:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8178169C;
	Wed, 27 May 2026 02:34:54 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A2003F632;
	Wed, 27 May 2026 02:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779874500; bh=pucLOH67JCbJzlHfMWr3MHIL2RqxwwPOtwYVFS7lMcw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UWp9fVmgXu0Iry4AFP6BdSo8C3KNKyNmkku9D/G3bGW3st4t/rPs9o1Z8fIfpd1g/
	 QArpI4D+vyIxkmxuCsD7N0lT1eYtYNdwQ4JKl6yqJqZNMFk8ajMPczN9zS/VsPPqJa
	 0WNJYTU6yW9LNteThP8Q6Zbjm/in/wKXFTtbswoY=
Date: Wed, 27 May 2026 10:34:32 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] regulator: scmi: fix of_node refcount leak in
 scmi_regulator_probe()
Message-ID: <aha6qETcWKIclqeS@pluto>
References: <20260527092521.866310-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260527092521.866310-1-vulab@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_023503_923302_F98C0D73 
X-CRM114-Status: GOOD (  17.40  )
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

On Wed, May 27, 2026 at 09:25:21AM +0000, Wentao Liang wrote:
> scmi_regulator_probe() calls of_find_node_by_name() which takes a
> reference on the returned device node. On the error path where
> process_scmi_regulator_of_node() fails, the function returns without
> calling of_node_put() on the child node, leaking the reference.
> 

Hi,

I have NOT really reviewed the need for of_node_put...BUT...

> Add of_node_put(np) on the error path to properly release the
> reference.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0fbeae70ee7c ("regulator: add SCMI driver")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/regulator/scmi-regulator.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/regulator/scmi-regulator.c b/drivers/regulator/scmi-regulator.c
> index 6d609c42e479..f1fe20b0fd76 100644
> --- a/drivers/regulator/scmi-regulator.c
> +++ b/drivers/regulator/scmi-regulator.c
> @@ -345,8 +345,10 @@ static int scmi_regulator_probe(struct scmi_device *sdev)
>  	for_each_child_of_node_scoped(np, child) {
>  		ret = process_scmi_regulator_of_node(sdev, ph, child, rinfo);
>  		/* abort on any mem issue */
> -		if (ret == -ENOMEM)
> +		if (ret == -ENOMEM) {
> +			rof_node_put(np);
		        ^....

...but you clearly not built this... 

Thanks,
Cristian

