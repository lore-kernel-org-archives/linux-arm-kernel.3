Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5553EA4FB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQvL1o0OvTI1mBRXe6J7e77H1AaWR0evF3QR4ks37Pc=; b=MGYgQJJ36XY1Xg/nX97fOS+irJ
	/13hEHXVjeYvU2k9G6TMlXVVnDOTgsVB0eIV408iUYiwSC6ZU1jcNlBXSLPvBpZ5d1JDp5TK23Vpt
	hOJfdCNbBfkGbrXeaxLe8gOgsaOvaoayMjATlWUjGBnYyud6vPau7Jc+BWUjjzUK8RBuYXYeSozxI
	p7ux2Tg4VJEkWAsxeQJQMgegbT3qfQBvzLQFb3HgOSg0998tmMUkWBn3JHIbo0mPk4MwEmVg7UYLV
	kuOoDVR3AXETpTbThTp49AtaIo+o5n1+s7Oadu+L+lqZQcjLNMBhOSIiXaCldLIP2PlQE99BwYX9I
	0SQI3MlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuU7q-00000000BGK-1Y8i;
	Mon, 23 Feb 2026 11:29:18 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuU7m-00000000BFl-1WAG;
	Mon, 23 Feb 2026 11:29:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771846154; x=1803382154;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fEP1EqpU5pWdSqvz/h+F1omgn6WyLNssApYypg0Qt4Y=;
  b=e0QOz0IRm6q9OCPcbzHkAz7mIzq3HGJiSCwDhpMSODbFCbLW9F9rYDg2
   MNpDk3aQTDqOPS2kLDVcTMSES/ineR7Ord8Fzl76E55yYW3RoOQZ7C2DA
   rd0s7vzItKIKaViZBBvqPXQxl03iLkR9ZZFk9fxAcUCibsg0otLN122x0
   TJ8J2xaOKFufY0l9Q4k3ckzIyE76dg99y6sLSDhRmcIuipznZm5cnkTa1
   G2qbA2d4DHZb3RxW1kOYbLhfL6XxuJqNH0Qo9JnxtJvdFudbeb+hZzcli
   P9X2RfkahIWZfs1CwpFRhOJ78RWDe3bPpNo5EsgQeozVHywG2ZxKaAt5z
   Q==;
X-CSE-ConnectionGUID: +V7DIQp/SoKItn82K8+gyA==
X-CSE-MsgGUID: 8VAuaVLtR+yROmhEltw2nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72877451"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="72877451"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 03:29:11 -0800
X-CSE-ConnectionGUID: hD9iXHfERW+iK52sDEl2XQ==
X-CSE-MsgGUID: vl4NaUoVTxiGaBJ/ElX4hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; 
   d="scan'208";a="253256215"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.222])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 03:29:06 -0800
Date: Mon, 23 Feb 2026 13:29:03 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Tobias Schrammm <t.schramm@manjaro.org>,
	Sebastian Reichel <sre@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH 3/9] power: supply: max77705: Free allocated workqueue
 and fix removal order
Message-ID: <aZw5_66M3jV30c1l@smile.fi.intel.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
 <20260223-workqueue-devm-v1-3-10b3a6087586@oss.qualcomm.com>
 <aZwWl57oJln1xH5m@smile.fi.intel.com>
 <388e52a2-4537-46f0-84d9-eb7a1f3b1660@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <388e52a2-4537-46f0-84d9-eb7a1f3b1660@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_032914_798380_0B3A8973 
X-CRM114-Status: GOOD (  13.25  )
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

On Mon, Feb 23, 2026 at 11:19:13AM +0100, Krzysztof Kozlowski wrote:
> On 23/02/2026 09:57, Andy Shevchenko wrote:
> > On Mon, Feb 23, 2026 at 08:27:31AM +0100, Krzysztof Kozlowski wrote:

...

> >>  	ret = devm_request_threaded_irq(dev, regmap_irq_get_virq(irq_data, MAX77705_CHGIN_I),
> >>  					NULL, max77705_chgin_irq,
> >>  					IRQF_TRIGGER_NONE,
> >>  					"chgin-irq", chg);
> >> -	if (ret) {
> >> -		dev_err_probe(dev, ret, "Failed to Request chgin IRQ\n");
> >> -		goto destroy_wq;
> >> -	}
> >> +	if (ret)
> >> +		return dev_err_probe(dev, ret, "Failed to Request chgin IRQ\n");
> > 
> > This should be just
> > 
> > 		return ret;
> > 
> > 
> > devm_*_irq() prints the message. No need to repeat this in the caller(s).
> > 
> 
> I guess separate commit then.

WFM!

-- 
With Best Regards,
Andy Shevchenko



