Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8978B606A328
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 23:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ski5IMK7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vbi2mlYP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uiwTdVTEUjpLNHmklGjK4vXL9miCcangUBoZKdOGahQ=; b=ski5IMK7+C/Dau
	JhFJqjqOWy97+iYzKeSgY7mANXH2No59R+UPOjXg+n7g+1Oqnzpb9VG4doVf44hOZLEP7i/Ku/zzL
	HJkNRGtq356lORVW+vsBjaICw++5ma+hvdH20OapuNEHXzQi8vTBeBzJ1tTASbD9IIysJ9crIeEVj
	6rBYfE4zoHKQgJggsFwVRTkLtaiezQOOow1Wu6yigcnBWxddP9Zm55IDt6AhNWbh80ZuCvsmA8WUY
	7qAdXYPuU2qrSMpTnzG0whW62UKmmMQQLNm6re1QOvtzjBlMFIgVBMcIF6DonJWFUxpjLL0LBARi+
	erRPd/0m1gUEhMBTnNvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONof-00000003whM-2775;
	Tue, 03 Nov 2026 23:21:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xONoe-00000003whE-12v8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 23:21:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C74143EFA;
	Tue,  3 Nov 2026 23:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FE871F000C1;
	Tue,  3 Nov 2026 23:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793748079;
	bh=uiwTdVTEUjpLNHmklGjK4vXL9miCcangUBoZKdOGahQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Vbi2mlYP+1AVsQu23mY5X6XhrWHW9pgucrNtCCShnFVF9fj2YDVDag2BD+tIo2eWz
	 2TeKja5KiWyu2OLCggSGnGqoIlYWtiaWsBnoUJugT365ucXu8p7W6g+g2ITt3NPtcn
	 tJFekbbIGT+/exTdZEmURyVOv+4UdGtMEMRUZNJetlq977tw6QemhIySUZ6n576wvl
	 IsW+JS1Vr6MdguEVlCYFlKe23sjNLmLPU42TjPPUdKEd+/e/Q7eyu7BrN3Ph+aFVuH
	 QRL8h76NpGRkifrMEXePzlISK2HXtLGYjimpCSSIoXqRfquoaA+WHmHCAfNxFn7Yk8
	 CVwdmg4ZquuHQ==
Date: Tue, 3 Nov 2026 23:21:09 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Fabrice Gasnier
 <fabrice.gasnier@st.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulfh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, Andy Shevchenko
 <andy@kernel.org>, David Lechner <dlechner@baylibre.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [PATCH v2 4/5] PM: runtime: Add tests for last_busy propagation
Message-ID: <20261103232109.2e334027@jic23-hlaptop>
In-Reply-To: <20261103141442.v2.4.I8ab8b7f662fe1921c7084a47d554535597cc2702@changeid>
References: <20261103221717.3840215-1-briannorris@chromium.org>
	<20261103141442.v2.4.I8ab8b7f662fe1921c7084a47d554535597cc2702@changeid>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue,  3 Nov 2026 14:14:42 -0800
Brian Norris <briannorris@chromium.org> wrote:

> This is a regression test for the problem fixed in "PM: runtime:
> Propagate last_busy from dependent to dependency".
> 
> Signed-off-by: Brian Norris <briannorris@chromium.org>

Trivial style stuff.

> ---
> 
> Changes in v2:
>  * Use device_move() instead of manual re-parenting
>  * fsleep() instead of msleep()
> 
>  drivers/base/power/runtime-test.c | 99 +++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/drivers/base/power/runtime-test.c b/drivers/base/power/runtime-test.c
> index 24865ce844fc..00ca3b10543a 100644
> --- a/drivers/base/power/runtime-test.c
> +++ b/drivers/base/power/runtime-test.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/cleanup.h>
> +#include <linux/delay.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/workqueue.h>
>  #include <kunit/device.h>
> @@ -285,6 +286,102 @@ static void pm_runtime_supplier_suspend_test(struct kunit *test)
>  	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(norpm_supplier));
>  }
>  
> +static void pm_runtime_parent_last_used_test(struct kunit *test)
> +{
> +	struct device *parent = kunit_device_register(test, DEVICE_NAME "_parent");
> +	struct device *dev = kunit_device_register(test, DEVICE_NAME);

Similar style comment to below.

> +	u64 expiry1, expiry2;
> +
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
> +
> +	KUNIT_ASSERT_EQ(test, 0, device_move(dev, parent, DPM_ORDER_NONE));
> +
> +	pm_runtime_set_active(parent);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_use_autosuspend(parent);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	pm_runtime_set_autosuspend_delay(dev, 0);
> +	/* Effectively infinite delay (prevent finishing autosuspend during this test). */
> +	pm_runtime_set_autosuspend_delay(parent, 200000);
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_mark_last_busy(parent);
> +
> +	pm_runtime_get_noresume(dev);
> +
> +	pm_runtime_enable(parent);
> +	pm_runtime_enable(dev);
> +
> +	expiry1 = pm_runtime_autosuspend_expiration(parent);
> +	KUNIT_EXPECT_NE(test, 0, expiry1);
> +
> +	/* Make absolutely sure the clock advances. */
> +	fsleep(1000);
> +
> +	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync_autosuspend(dev));
> +
> +	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
> +
> +	/* Flush, in case any request was pending. */
> +	flush_workqueue(pm_wq);
> +	KUNIT_EXPECT_FALSE(test, pm_runtime_suspended(parent));
> +
> +	expiry2 = pm_runtime_autosuspend_expiration(parent);
> +	KUNIT_EXPECT_NE(test, 0, expiry2);
> +	/* The child's last_busy time should have bumped up the parent's expiration. */
> +	KUNIT_EXPECT_GT(test, expiry2, expiry1);
> +}
> +
> +static void pm_runtime_supplier_last_used_test(struct kunit *test)
> +{
> +	struct device *supplier = kunit_device_register(test, DEVICE_NAME "_supplier");
> +	struct device *dev = kunit_device_register(test, DEVICE_NAME);
Having the assignment clear of the error check is never great, but now there are multiple
devs, I'd definitely move them.

	struct device *supplier, *dev;

> +	u64 expiry1, expiry2;
> +
	supplier = kunit_device_register(test, DEVICE_NAME "_supplier");
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);

	dev = kunit_device_register(test, DEVICE_NAME);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, supplier);

> +
> +	KUNIT_ASSERT_NOT_NULL(test, device_link_add(dev, supplier, DL_FLAG_PM_RUNTIME));
> +
> +	pm_runtime_set_active(supplier);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_use_autosuspend(supplier);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	pm_runtime_set_autosuspend_delay(dev, 0);
> +	/* Effectively infinite delay (prevent finishing autosuspend during this test). */
> +	pm_runtime_set_autosuspend_delay(supplier, 200000);
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_mark_last_busy(supplier);
> +
> +	pm_runtime_get_noresume(dev);
> +
> +	pm_runtime_enable(supplier);
> +	pm_runtime_enable(dev);
> +
> +	expiry1 = pm_runtime_autosuspend_expiration(supplier);
> +	KUNIT_EXPECT_NE(test, 0, expiry1);
> +
> +	/* Make absolutely sure the clock advances. */
> +	fsleep(1000);
> +
> +	KUNIT_EXPECT_EQ(test, 0, pm_runtime_put_sync_autosuspend(dev));
> +
> +	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
> +
> +	/* Flush, in case any request was pending. */
> +	flush_workqueue(pm_wq);
> +	KUNIT_EXPECT_FALSE(test, pm_runtime_suspended(supplier));
> +
> +	expiry2 = pm_runtime_autosuspend_expiration(supplier);
> +	KUNIT_EXPECT_NE(test, 0, expiry2);
> +	/* The consumer's last_busy time should have bumped up the supplier's expiration. */
> +	KUNIT_EXPECT_GT(test, expiry2, expiry1);
> +}
> +
>  static struct kunit_case pm_runtime_test_cases[] = {
>  	KUNIT_CASE(pm_runtime_depth_test),
>  	KUNIT_CASE(pm_runtime_already_suspended_test),
> @@ -293,6 +390,8 @@ static struct kunit_case pm_runtime_test_cases[] = {
>  	KUNIT_CASE(pm_runtime_error_test),
>  	KUNIT_CASE(pm_runtime_probe_active_test),
>  	KUNIT_CASE(pm_runtime_supplier_suspend_test),
> +	KUNIT_CASE(pm_runtime_parent_last_used_test),
> +	KUNIT_CASE(pm_runtime_supplier_last_used_test),
>  	{}
>  };
>  


