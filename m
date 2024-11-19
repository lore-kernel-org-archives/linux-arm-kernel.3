Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8612D44146
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvNs9jTFC+vvsWUY8Alhqtf1e8UARS1YpFbeMu7TsYc=; b=kOaU/OxKLv6IIvJa1EtUgEooG4
	9HQGrza5PI52AQ7hiLgPnhJrOpK41ogjYhAiPU3DZutIRfMRumF+OUmp6ScYFprpQ74wOkTzFhsNV
	J1e3iu+SVtTC7r0aa0gt97P9RyMGQzRUTFL1WrEsvmxEv7plneYVCX/bv5PCbuDLp75ZVni7L1MP2
	dP2f7acAmhoxVpsBeXo1NkfXP6QjIDUj8ywBTQwPjWwzhJoMT4rFKzmHztqmA8lT8u97I1hMUu0zf
	KLhbwW7ezdwk4BhwUZEdlFtI5BQZddS+kSB72vM5/XMXuKs3rBcaJrtYza1s5rZMMvlts1x/YsOy4
	yFqLzNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMP8-0000000CDQB-1fr6;
	Tue, 19 Nov 2024 11:28:22 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMOA-0000000CDH3-3pfH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 11:27:25 +0000
Received: from francesco-nb (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 9F36C1FCB5;
	Tue, 19 Nov 2024 12:22:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1732015330;
	bh=mvNs9jTFC+vvsWUY8Alhqtf1e8UARS1YpFbeMu7TsYc=; h=From:To:Subject;
	b=ob7uqVwpl3w5QJgm2XonVBAtDi8g/P7wzlNRRlWJe8OQ8+X6mHMaq7p/C66JfdhAa
	 oXkD76CvIqGPdLHHhQ2FTzZRTntGF8iojjTcD56jMl7MgkSTN5FtBwOId1dNQl/I/x
	 Du8Ap2xftzojyF5N22CeDJRycbdWd/pqyJuGUZgMk/2lRCBkr7bPF5pHHzYSTuD1XX
	 7uIlg0rJPJQSLHZcRux9IbbQnkARE/87HTtNmECe7Eljq+Ctb0t4f+R2wVFvL+YhCI
	 X0DYb7ajtYeIw3TFa4UHJ76fXt/QAiuuvxRmRu+sgkTROyvjsMznSywwRonOVXe+vg
	 7MdqR+3Mcon6Q==
Date: Tue, 19 Nov 2024 12:22:01 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>,
	abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mark Brown <broonie@kernel.org>, ulf.hansson@linaro.org
Subject: Re: clk_imx8mp_audiomix_runtime_resume Kernel panic regression on
 v6.12
Message-ID: <20241119112201.GA17768@francesco-nb>
References: <20241007132555.GA53279@francesco-nb>
 <20241112075958.GA8092@francesco-nb>
 <20241112092054.GA18139@francesco-nb>
 <CAA+D8AO3a5WsZ4=V-9CDifDZYjJjwQmQQDDQM7ZKgZ6_-CNDPA@mail.gmail.com>
 <Zzde9xS0zGJhcoUb@gaggiata.pivistrello.it>
 <CAA+D8AMx14hp51aH7Y=Sgu+X+_KxQ8zdJdrQHFY84nKtQsKKrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA+D8AMx14hp51aH7Y=Sgu+X+_KxQ8zdJdrQHFY84nKtQsKKrw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_032723_793485_0B844E0D 
X-CRM114-Status: GOOD (  31.68  )
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

Hello Shengjiu,

On Tue, Nov 19, 2024 at 05:35:36PM +0800, Shengjiu Wang wrote:
> On Fri, Nov 15, 2024 at 10:47 PM Francesco Dolcini <francesco@dolcini.it> wrote:
> >
> > On Fri, Nov 15, 2024 at 11:13:58AM +0800, Shengjiu Wang wrote:
> > > On Tue, Nov 12, 2024 at 5:20 PM Francesco Dolcini <francesco@dolcini.it> wrote:
> > > >
> > > > On Tue, Nov 12, 2024 at 08:59:58AM +0100, Francesco Dolcini wrote:
> > > > > On Mon, Oct 07, 2024 at 03:25:55PM +0200, Francesco Dolcini wrote:
> > > > > > it seems that an old regression is back on v6.12, reproduced on -rc2
> > > > > > (not sure about rc1).
> > > > > >
> > > > > > The original report is from https://lore.kernel.org/all/20240424164725.GA18760@francesco-nb/
> > > > > > and it was fixed with https://lore.kernel.org/all/1715396125-3724-1-git-send-email-shengjiu.wang@nxp.com/.
> > > > > >
> > > > > > Is it now back?
> > > > >
> > > > > I was able to reproduce this issue once more, this time with 6.11.7.
> > > > > As I wrote in another email the issue is not systematic as it used to
> > > > > be.
> > > > >
> > > > > Any idea?
> > > >
> > > > Frank, Shengjiu, could it be that the udelay(5) in imx_pgc_power_up() is
> > > > too short and therefore we have such non-systematic failures?
> > > >
> > >
> > > Francesco,  it seems hard to reproduce it on my i.MX8MP-EVK board.
> > >
> > > If it is easy to reproduce on your side, you can try to enlarge the delay
> > > time to see if there is any improvement.
> >
> > It's hard also for me to reproduce, we just have a relatively extensive
> > test farm and 2 times it happened while doing unrelated tests. I was hoping we
> > could have some idea on what's going on, I'll see if I can put together some
> > kind of stress test, being able to reproduce it more systematically would
> > certainly help.
> >
> 
> With my test,  the issue reproduced with delay 5us/6us. but hard reproduced
> with 7us.
> I think we may need to use a delay of 10us for safety.

Great that you were able to narrow this down and confirm the issue.
I wonder if you would have any information on what is the actual delay
that the HW would need, instead of guessing numbers. If not, well, let's
go with 15usec, or 10usec, your call in the end.

Will you send a patch?

Francesco


