Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361E9C36005
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 21:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBeUTpT2t412/JfiZLet7BJsAyt82xNb5neXkHOi5YY=; b=28dgRtcY04K6WxBR8FxFN636pB
	67m2DWnnMEkX2jp5S7eKJnZqhVKviwAMDx4lyatT8R5H84WO4R0SoejHTOgTBHLoeplj8zgZ3LR/0
	HEku8AHuRa+6UM9rcV/tQPtfQHZhOtKHNY90m9L20zA2EBQcxizzsz0pSNTwKrJCydsPA6PLZT7tr
	APe7w9uT0vVZ2xohxeDcfBVsWn5hE0gB2G4N7HzURXO1iWkmq2gXqHhkOEIhFLFW+PgZaAqxJwiHE
	zdaLBHXwHnm+MEXoX2SsIS2yhQszVcwy8zu2KEd5Rex+Jd2XfESWlq/uQyoIUW80uFB7Ve6ZlOrL/
	jHQ5sD4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txCIP-000000077Yg-13I4;
	Tue, 25 Mar 2025 21:58:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txCGf-000000077M4-2oHM;
	Tue, 25 Mar 2025 21:57:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEEEE43D31;
	Tue, 25 Mar 2025 21:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B47C4CEE4;
	Tue, 25 Mar 2025 21:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742939824;
	bh=dVbKSNw9IpYPnjB4Ud3V8KshkTL7MxnrLDQsyEYyjgs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=U1XyMEmNYZIlwYioOLPxclfPhiC+yUspDrhkZq+hTqghQwVjwS0zv2BVZbh2GVg89
	 9otj4z/5i+7itFygyS8sD2cfaHriu6bLgJ+l2P2O8hQcSU07nLPDrKt6M4tqEiyvTN
	 ZztdVM9vFRbExjb0NzQBvOzxk1yXRP+VN0G1BYdUBCQSyPbstgBzS2TUHuWaR50a3y
	 K+QkC1xQ9k0hM3kXBkBIHNSQwO3eKsLYojZ/rXqJ47GtUh8Vp5DMdu+XGaOkqmjQ5Z
	 M+w1s7PRQfeXZQDUQ/oAR4FiAcUtlN+24cCvCuOOSvJv6Tf8GZYWBI4h/atfb8K5aF
	 KzDUpJTwDMq2g==
Message-ID: <4db0bf5937c6c2a480b89b11e841782c@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jv7s21d8y.fsf@starbuckisacylon.baylibre.com>
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com> <20250120-amlogic-clk-drop-clk-regmap-tables-v3-1-126244146947@baylibre.com> <508a5ee6c6b365e8d9cdefd5a9eec769.sboyd@kernel.org> <1jv7s21d8y.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH v3 1/4] clk: add a clk_hw helpers to get the clock device or device_node
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 25 Mar 2025 14:57:01 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_145705_748342_283147AD 
X-CRM114-Status: GOOD (  26.99  )
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

Quoting Jerome Brunet (2025-03-21 10:53:49)
> On Wed 26 Feb 2025 at 17:01, Stephen Boyd <sboyd@kernel.org> wrote:
>=20
>=20
> >> +static void clk_hw_get_of_node_test(struct kunit *test)
> >> +{
> >> +       struct device_node *np;
> >> +       struct clk_hw *hw;
> >> +
> >> +       hw =3D kunit_kzalloc(test, sizeof(*hw), GFP_KERNEL);
> >> +       KUNIT_ASSERT_NOT_ERR_OR_NULL(test, hw);
> >> +
> >> +       np =3D of_find_compatible_node(NULL, NULL, "test,clk-dummy-dev=
ice");
> >> +       hw->init =3D CLK_HW_INIT_NO_PARENT("test_get_of_node",
> >> +                                        &clk_dummy_rate_ops, 0);
> >> +       of_node_put_kunit(test, np);
> >> +
> >> +       KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, np, hw=
));
> >
> > The stuff before the expectation should likely go to the init function.
> > Or it can use the genparams stuff so we can set some struct members to
> > indicate if the pointer should be NULL or not and then twist through the
> > code a couple times.
> >
>=20
> I'm trying to address all your comments but I'm starting to wonder if
> this isn't going a bit too far ? The functions tested are one line
> returns. Is it really worth all this ?
>=20
> I do understand the idea for things that actually do something, such as
> reparenting, setting rates or what not ... But this ? It feels like a
> lot of test code for very little added value, don't you think ?
>=20

Just so I understand, you're saying that this is always going to be a
simple "getter" API that doesn't do much else? We're not _only_ testing
the getter API, we're also testing the registration path that actually
sets the device or of_node pointers for a clk. I'm not really thinking
about the one line return functions here.

Writing tests is definitely a balancing act. I'd say we want to test the
behavior of the API in relation to how a clk is registered and writing
tests to show the intended usage is helpful to understand if we've
thought of corner cases like the clk was registered with a device
pointer that also has an of_node associated with it. (Did we remember to
stash that of_node pointer too?) We have a bunch of clk registration
APIs, and we want to make sure this getter API works with all of them.
Note that we don't care about the clk flags or parent relation chains
here, just that the device or of_node passed in to registration comes
out the other side with the getter API.

A little code duplication is OK, as long as the test is easy to
understand. Maybe genparams stuff is going too far, I don't know, but at
the least we want to make sure the clk registration APIs behave as
expected when the getter API is used to get the device or of_node later.

I've found this google chapter[1] useful for unit testing best
practices. I recommend reading it if you haven't already.

[1] https://abseil.io/resources/swe-book/html/ch12.html

