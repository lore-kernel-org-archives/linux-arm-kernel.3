Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A50C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 12:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jyEkPF9QjFxAuLX7joeVpRJHHAcWObix5FAN064Z/Y=; b=NybxKdNrls4YAFcIFA5sTJT2o9
	iYV2AbUd/cV656lonpXbCjGJ5MkA2KD0aEXUOSoPgBTbNeRs8ePgE8mRhrbWzBs3H8sphMM8kBJ3H
	IsscwhksN7OcUot8AcJ8pY/sWLu+UELHrrv3GPywFZzI7zgYw1Piy/WOJLEASBkpjuAeLgx7B7nFD
	P+zJZmP4SNrmHgq5atpH+sa3ts6oHr/FzVAfpdTtQtjaNQy3UT09ScqRZ2JyiKnCLK88YEHbqrWKa
	g+0o6d7UBU/WDZA8YwvNM6oxWWnRSWlhKRKD5jYXTftiuUPN3p9snHBLpWWyE+d6pGCO9jv77sbNX
	+OCDPgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2pSK-000000043iC-0TKD;
	Sat, 05 Sep 2026 12:25:12 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2pSG-000000043hh-3wA4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 12:25:10 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-485888b3c3dso2007088f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 05:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611107; x=1789215907; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6jyEkPF9QjFxAuLX7joeVpRJHHAcWObix5FAN064Z/Y=;
        b=BOAnjP/FPdDG8/d2N9oSHlmqS0IgIsJqoO8D3ZFpcsoR/+G1weV1ms7INwQNhkmEVh
         YegT+nUwWSPx/StNEs+DlF4kT5fayPPTzQM+n8nPzHWBte0ImqXTAYXUU67K/W4bBI6q
         QDkC5LzlRGOXqObghPe5J67DU1/7BkYeWTxUFLtJsrmemVfRRIVcq/0qeAbdBj7eFOzy
         F+EMAo5g5eRReCYKq8eiPqJt5s/oTYjSy96je9A8gQgOKCB/bMTPb2ryEqF4y2dooGSV
         GzJUC7/tMTWUJXWbCPpt3OxSMukEmXFw/AGk9M1n4YowJhSGPVyo5As5IV5b6TD/ntn2
         CyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611107; x=1789215907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6jyEkPF9QjFxAuLX7joeVpRJHHAcWObix5FAN064Z/Y=;
        b=exCipLtezLaM3xIfIyrcXl6v21BmT2cXs1HBZD9k6LCutlz4iewF8yW6Pz7U4yo3UY
         JqUpjPoNUnAy0nUY+bdOfdRIDabSAaHv02WH7RkxYRMI6m9ttixI2T+Uc/0WmaglL7Kn
         Mx7vTj8D9rfTTi2UxdxfJEa3LPypNjKxAcc+6xF4kpSLIVNAr4WJc0fmbvvz+v9rPQ+L
         gQ1yV8Jc3La3wQJeQjBcW4K8byYdPOX7XshF2qc+KvqAFDr2aFHZ/Io7QKdVPvZZSNqn
         Y2ZAjkX7Zo4D9F02GSFjB9r1SG5nPejls0WQmqBx1Qt0zjVQd9mDaKTnqppQV/fhQeLt
         P/QA==
X-Forwarded-Encrypted: i=1; AKwUvBw9H8X4v22Wyi/WfOR6rvNCEbDPLW7112IqY/a2nM8k03eJLkDbHU78vE1QMHD/mC0umRUhv1kn98HmREeStnAA@lists.infradead.org
X-Gm-Message-State: AFuF++nNnazJnbcjlE2Vz38WoKiy0YQ2vsCLlF2aF09RmaqQs6PTlXtQ
	GXpLZ2bNi5mDjmJxPjP3XnvUZuadGwfMuUrbd0NP4Bg80viVrHYUp7CD
X-Gm-Gg: AYBFou3EaNFM9lqqIQwlzaMJR8Tda4r42jD8noOSlmzX5eSdQNE0a02xiqgoswbSOeB
	8+cOKGEc8wPH8PLldMVCocnv4vbiCfEv0By7fPE5SiUyM5j0JHi24tw2vQFJJL3UKucr/qMTsis
	SaAUrpXquh01dRlgrLBJXSsmVQY1zBYLCDDqO4c4uYXQXUR4hFkhZOm1BZfqYqustPIVZ7hTK6n
	Y7R0//JzWL59jlJYS7VjwpjiaUoHddgQNwH2sBA2+bURlh8U0PBkhO+lBx9soseXYPqwQIcph6q
	p7rfGl/TOF0w1fBfAJy5yg5Ow6HLftA1WG73cM8DRKBqE0JIMPvzR74wVWL44BnJqZN5eM8zw8O
	h7/VLLN20YfxEQPWhb7FThXOSIKUxnsXkD3BLAyrV98b+b3x7waUP3RBsdswjlIKrZccQcC1/gS
	FiAIpxKmpwObTSjsgo1o8ZZblCS2egbgx5FNK6NiRI+QG21m1nwaPtMD8Aj1UF63jvDFuH8K4Rb
	z3hx8dW30IGoMYRFdRXM8V1hDAgSuSY1tqLE+BOjbN+XBwPiXsA05sZL0VVaLo6/mIaohmHkOmF
	rHq0bJV7NWODx/RQg4BL6/S7pG9b15Zn7n9KSiU+9HZ0wl5Ze7ll4WiATusAGqak
X-Received: by 2002:a05:6000:41db:b0:485:82f9:44b4 with SMTP id ffacd0b85a97d-4858709c044mr15925496f8f.7.1788611106580;
        Sat, 05 Sep 2026 05:25:06 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588392b3esm15549562f8f.12.2026.09.05.05.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:25:05 -0700 (PDT)
Date: Sat, 5 Sep 2026 14:25:02 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, 
	Dimitri Sivanich <dimitri.sivanich@hpe.com>, Mike Travis <mike.travis@hpe.com>, 
	Tony Luck <tony.luck@intel.com>, "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@baylibre.com>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, Damien Le Moal <dlemoal@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, linux-ide@vger.kernel.org, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>, 
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH v2 0/9] docs: kernel-parameters: Remove ten entries for
 parameters that no longer exist
Message-ID: <apwIbDr0kyquxVoL@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
 <693303da-350b-4295-b008-6fee8bb4c591@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <693303da-350b-4295-b008-6fee8bb4c591@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_052509_020407_3DBB4303 
X-CRM114-Status: GOOD (  25.07  )
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

On Sat, Sep 05, 2026 at 12:12:51PM +0100, Arnd Bergmann wrote:
> On Sat, Sep 5, 2026, at 11:46, Karl Mehltretter wrote:
> > kernel-parameters.txt still documents ten boot parameters whose parsing
> > code was removed with the drivers or platforms that used them, one of
> > them (atarimouse=) since before the git history. One patch per
> > parameter, each with a Fixes: tag for the commit that removed the
> > parser, so the maintainers of that area are on their own patch only;
> > the two pata_legacy module parameters share the last one. Each entry
> > was checked with git grep for its __setup(), early_param() and
> > module_param() handler and with git log -S for the removing commit.
> 
> These all look good to me,
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> 
> If you have a script that you can easily run on another tree,
> could you send me the script or the output for this one?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=board-remove
> 

Thanks for the review! Yes, here is the script, improved a bit since the
series was made.

It does not show anything on your branch though. board-remove at
c12d647b0229 removes 40 registrations, none of them a documented
parameter that loses its parser. The three documented names among them
(debug, irq, noalign) are still registered by other code.

Run it with
    check-kernel-parameters.py -C ~/soc --diff 8d3ae59288f1 board-remove

Its report mode turned up a second batch of stale entries on mainline
(r128=, mga=, i810=, tdfx=, smart2=, shapers=, hd=, goldfish, js= and a
few more), which I might send later.

Thanks
Karl

The script:

#!/usr/bin/env python3
# SPDX-License-Identifier: GPL-2.0
"""Find documented boot parameters that nothing parses any more.

Reads Documentation/admin-guide/kernel-parameters.txt at a git revision and
looks for the registration of every documented name in the code at the same
revision: __setup(), early_param(), core_param(), module_param() and friends.
Names without a registration are printed together with whether the name at
least still appears as a string somewhere (cmdline_find_option() style
parsing), so a human can decide. A parameter that was only ever parsed by
hand, without any of the macros, is invisible in both modes.

Usage:
    check-kernel-parameters.py [-C tree] [REV]           report for one revision
    check-kernel-parameters.py [-C tree] --diff A B      names parsed at A but not at B

Runs entirely on git objects (git grep / git show), no checkout needed.
"""
import argparse, re, subprocess, sys

REG = r'(__setup|__setup_param|early_param|early_param_on_off|core_param|core_param_unsafe|late_param|module_param|module_param_unsafe|module_param_named|module_param_named_unsafe|module_param_cb|module_param_cb_unsafe|module_param_call|device_param_cb|module_param_string|module_param_array|module_param_array_named|module_param_hw|module_param_hw_named|module_param_hw_array|__core_param_cb|torture_param|param_check_\w+)\s*\('
LEGEND_STOP = 'Kernel parameters'   # the tag legend ends at this heading, the parameter list follows

def git(tree, *a):
    r = subprocess.run(['git', '-C', tree, *a], capture_output=True, text=True, errors='replace')
    if r.returncode and 'grep' not in a[0]:
        sys.exit(f'git {a[0]} failed: {r.stderr.strip()}')
    return r.stdout

def documented(tree, rev):
    """Return {name: line} for every parameter entry in kernel-parameters.txt at rev."""
    txt = git(tree, 'show', f'{rev}:Documentation/admin-guide/kernel-parameters.txt')
    names = {}
    in_list = False
    for n, line in enumerate(txt.split('\n'), 1):
        if not in_list:
            if line.strip() == LEGEND_STOP: in_list = True
            continue
        m = re.match(r'^\t([A-Za-z][A-Za-z0-9_.-]*)(?:=|\s|$)', line)
        if not m: continue
        name = m.group(1)
        if name.isupper() and '.' not in name: continue     # a stray tag, not a parameter
        names.setdefault(name, n)
    return names

def registered(tree, rev):
    """Return the set of names registered by the parameter macros at rev."""
    out = git(tree, 'grep', '-h', '-E', REG, rev, '--', ':!Documentation', ':!tools', ':!scripts')
    names = set()
    for line in out.split('\n'):
        for m in re.finditer(REG + r'\s*"?([A-Za-z0-9_.-]+)', line):
            name = m.group(2)
            if m.group(1) == 'torture_param':     # torture_param(type, name, init, msg): the type comes first
                mm = re.search(r'torture_param\s*\(\s*\w+\s*,\s*([A-Za-z0-9_]+)', line)
                if mm: name = mm.group(1)
            names.add(name.rstrip('='))
    return names

def string_hits(tree, rev, name):
    """Files at rev that contain the name as a quoted string (manual command line parsing);
    a dotted name is looked up whole first (arm64.nobti style tables), then by its last part."""
    for probe in ([name, name.rsplit('.', 1)[-1]] if '.' in name else [name]):
        out = git(tree, 'grep', '-l', '-F', f'"{probe}', rev, '--', ':!Documentation', ':!tools', ':!scripts')
        hits = [l.split(':', 1)[1] for l in out.split('\n') if l]
        if hits: return hits
    return []

def parsed_at(tree, rev):
    docs = documented(tree, rev)
    regs = registered(tree, rev)
    def ok(name):
        if name in regs: return True
        base = name.rsplit('.', 1)[-1]          # module.param= is registered as module_param(param)
        return base in regs
    return docs, {n for n in docs if ok(n)}

def report(tree, rev):
    docs, ok = parsed_at(tree, rev)
    missing = sorted(n for n in docs if n not in ok)
    print(f'{len(docs)} documented parameters at {rev}, {len(missing)} without a registration macro:')
    for n in missing:
        hits = string_hits(tree, rev, n)
        tag = f'string appears in {hits[0]}' + (f' (+{len(hits)-1})' if len(hits) > 1 else '') if hits else 'NOT FOUND anywhere'
        print(f'  {n:40} kernel-parameters.txt:{docs[n]:<6} {tag}')

def diff(tree, a, b):
    docs_a, ok_a = parsed_at(tree, a)
    docs_b, ok_b = parsed_at(tree, b)
    lost = sorted(n for n in ok_a if n in docs_b and n not in ok_b)
    print(f'documented parameters parsed at {a} but no longer at {b}: {len(lost)}')
    for n in lost:
        hits = string_hits(tree, b, n)
        print(f'  {n:40} kernel-parameters.txt:{docs_b[n]:<6} ' + (f'string still in {hits[0]}' if hits else 'no string left either'))

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('-C', dest='tree', default='.')
    ap.add_argument('--diff', nargs=2, metavar=('A', 'B'))
    ap.add_argument('rev', nargs='?', default='HEAD')
    a = ap.parse_args()
    if a.diff: diff(a.tree, *a.diff)
    else: report(a.tree, a.rev)

